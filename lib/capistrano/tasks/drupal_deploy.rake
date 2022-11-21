# frozen_string_literal: true

def maintenance!(enable: true)
  execute :drush, 'state:set', 'system.maintenance_mode', enable.to_s.upcase
end

def composer_auth
  compjson = File.expand_path('../../../composer.json', File.dirname(__FILE__))
  composer = JSON.load File.read(compjson)
  if composer['repositories']
    composer['repositories'].collect { |e| e['url'] }.each do |u|
      if u =~ /oauth2:/ then
        require 'uri'
        url = ::URI.parse u
        if url.user and url.password then
          execute :composer, 'config', '--global', "http-basic.#{url.host}", url.user, url.password
        end
      end
    end
  end
end

def cache_clear
  execute :drush, 'cache:rebuild'
end

def update_db
  maintenance!
  execute :drush, 'updatedb', '-y', '--cache-clear', '--post-updates'
  cache_clear
end

def site_uuid
  siteyml = File.expand_path('../../../config/sync/system.site.yml', File.dirname(__FILE__))
  if File.exist? siteyml
    YAML.load_file(siteyml)['uuid']
  else
    SecureRandom.uuid
  end
end

def lang_uuid(lang)
  langyml = File.expand_path("../../../config/sync/language.entity.#{lang}.yml", File.dirname(__FILE__))

  if File.exist? langyml
    YAML.load_file(langyml)['uuid']
  else
    SecureRandom.uuid
  end
end

def languages
  langymls = Dir.glob File.expand_path('../../../config/sync/language.entity.*.yml', File.dirname(__FILE__))
  langs = langymls.map do |f|
    File.basename(f).sub('language.entity.', '').sub(/\.yml$/, '').to_sym
  end
  langs.find_all { |lang| !%i[zxx und en].include?(lang) }
end

namespace :load do
  task :defaults do
    set :drupal_root, 'web'
  end
end

namespace :composer do
  task :install do
    on roles(:app) do
      within release_path do
        composer_auth
        execute :composer, 'install', '--no-progress', '--no-interaction', '--prefer-dist'
      end
    end
  end
end

# rubocop:disable Metrics/BlockLength
namespace :drupal do
  task :set_paths do
    SSHKit.config.command_map[:drupal] =
      "#{fetch(:php_path, '/usr/bin/php')} -d memory_limit=-1 #{shared_path}/vendor/bin/drupal"
    SSHKit.config.command_map[:drush] =
      "#{fetch(:php_path, '/usr/bin/php')} -d memory_limit=-1 #{shared_path}/vendor/bin/drush"
    SSHKit.config.command_map[:composer] = lambda {
      "#{fetch(:php_path, '/usr/bin/php')} -d memory_limit=-1 -d allow_url_fopen=1 #{release_path}/composer.phar"
    }
  end

  namespace :site do
    task :backup do
      # TODO: Rewrite me when https://www.drupal.org/project/backup_migrate/issues/2968766 closed
      on roles(:app) do
        within current_path.join(fetch(:drupal_root)) do
          execute :drush, 'eval', %{'backup_migrate_perform_backup("default_db", "private_files", []);'}
        end
      end
    end

    desc 'Setting up a brand new drupal instance based on the configs we have'
    task :setup do
      invoke 'deploy:check'
      invoke 'drupal:set_paths'
      invoke 'deploy:updating'
      invoke 'composer:install'

      on roles(:app) do
        within release_path.join(fetch(:drupal_root)) do
          execute :drush, 'site:install', "--root=#{release_path.join(fetch(:drupal_root))}", '--locale=hu',
                  '--account-name=csopadmin', '--account-mail=info@csopak.hu', '--site-mail=spam@csopak.hu', '-y',
                  '--existing-config'
          execute :drush, 'config:set', '-y', 'system.site', 'uuid', site_uuid
          languages.each do |lang|
            execute :drush, 'config:set', '-y', "language.entity.#{lang}", 'uuid', lang_uuid(lang)
          end
          execute :drush, 'config:import', "--root=#{release_path.join(fetch(:drupal_root))}", '-y'
          languages.each do |lang|
            execute :drush, 'locale:import', "--root=#{release_path.join(fetch(:drupal_root))}", lang,
                    release_path.join("translations/#{lang}.po"), '--override=all',
                    '--type=customized'
          end
        end
      end

      invoke 'deploy:publishing'
      invoke 'deploy:published'
      invoke 'deploy:finishing'
      invoke 'deploy:finished'
    end

    task :offline do
      on roles(:app) do
        if test("[ -d #{current_path} -a -f #{shared_path.join('vendor/bin/drupal')} ]")
          within current_path.join(fetch(:drupal_root)) do
            # execute :drupal, 'site:maintenance', 'on'
            maintenance!
          end
        end
      end
    end

    task :online do
      on roles(:app) do
        within release_path.join(fetch(:drupal_root)) do
          # execute :drupal, 'site:maintenance', 'off'
          maintenance! enable: false
        end
      end
    end
  end

  task :update do
    on roles(:app) do
      within release_path.join(fetch(:drupal_root)) do
        update_db
        maintenance!
        execute :drush, 'config:import', "--root=#{release_path.join(fetch(:drupal_root))}", '-y'
        execute :drush, 'cache:rebuild'
        languages.each do |lang|
          execute :drush, 'config:set', '-y', "language.entity.#{lang}", 'uuid', lang_uuid(lang)
        end
        execute :drush, 'config:import', "--root=#{release_path.join(fetch(:drupal_root))}", '-y'
        # rubocop:disable Lint/UselessAssignment
        # confsplit_profile = "config_#{fetch(:stage).to_s[0..3]}"
        # rubocop:enable Lint/UselessAssignment
        # execute :drush, 'config-split:import', confsplit_profile, '-y'
        # execute :drush,  'locale:check'
        # execute :drush,  'locale:update'
        execute :drush, 'locale:rebuild'
        languages.each do |lang|
          execute :drush, 'locale:import', "--root=#{release_path.join(fetch(:drupal_root))}", lang,
                  release_path.join("translations/#{lang}.po"), '--override=all',
                  '--type=customized'
        end
        maintenance!
        maintenance! enable: false
      end
    end
  end

  namespace :cache do
    task :clear do
      on roles(:app) do
        within release_path.join(fetch(:drupal_root)) do
          # execute :drupal, 'cache:rebuild'
          cache_clear
        end
      end
    end
  end

  namespace :symlink do
    task :htdocs do
      on roles(:app) do
        execute :rm, '-f', deploy_path.join('htdocs')
        execute :ln, '-sf', release_path, deploy_path.join('htdocs')
      end
    end

    task :htaccess do
      on roles(:app) do
        execute :rm, '-f', release_path.join('web/.htaccess')
        execute :ln, '-sf', release_path.join('htaccess.txt'), release_path.join('web/.htaccess')
      end
    end
  end

  namespace :cleanup do
    task :unharden do
      on roles(:app) do
        real_current = capture(:readlink, current_path)
        dirs = capture(:ls, '-xd', releases_path.join('*/web/sites/default')).split.find_all do |dir|
          !dir.match(real_current)
        end
        dirs.each do |default_dir|
          execute :chmod, 'u+w', default_dir
        end
      end
    end

    task :harden do
      on roles(:app) do
        real_current = capture(:readlink, current_path)
        dirs = capture(:ls, '-xd', releases_path.join('*/web/sites/default')).split.find_all do |dir|
          !dir.match(real_current)
        end
        dirs.each do |default_dir|
          execute :chmod, 'u-w', default_dir
        end
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength

after 'deploy:updating', 'drupal:set_paths'
# before 'deploy:updated', 'drupal:site:offline'
after 'deploy:updated', 'composer:install'
# before 'deploy:updated', 'drupal:site:backup'
# after 'deploy:updated', 'drupal:update'
# after 'deploy:published', 'drupal:site:online'
# after 'deploy:published', 'drupal:cache:clear'
# before 'deploy:cleanup', 'drupal:cleanup:unharden'
# after 'deploy:cleanup', 'drupal:cleanup:harden'
