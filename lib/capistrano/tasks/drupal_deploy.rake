namespace :load do
  task :defaults do
    set :drupal_root, 'web'
  end
end


namespace :composer do
  task :install do
    on roles(:app) do
      within release_path do
        execute :composer, 'install', '--no-progress', '--no-interaction', '--prefer-dist'
      end 
    end
  end
end

namespace :drupal do
  task :set_paths do
    SSHKit.config.command_map[:drupal] = "#{fetch(:php_path, '/usr/bin/php')} -d memory_limit=-1 #{shared_path}/vendor/bin/drupal"
    SSHKit.config.command_map[:drush] = "#{fetch(:php_path, '/usr/bin/php')} -d memory_limit=-1 #{shared_path}/vendor/bin/drush"
    SSHKit.config.command_map[:composer] = "#{fetch(:php_path, '/usr/bin/php')} -d memory_limit=-1 -d allow_url_fopen=1 #{release_path}/composer.phar"
  end

  namespace :site do
    task :backup do
      # TODO Rewrite me when https://www.drupal.org/project/backup_migrate/issues/2968766 closed
      on roles(:app) do
        within current_path.join(fetch(:drupal_root)) do
          # execute :drupal, 'snippet', %{--code='backup_migrate_perform_backup("default_db", "private_files", []);'}
          execute :drush, 'eval', %{'backup_migrate_perform_backup("default_db", "private_files", []);'}
        end
      end
    end


    task :setup do
      invoke 'drupal:set_paths'

      on roles(:app) do
        within current_path.join(fetch(:drupal_root)) do
          execute :drush, 'site:install', "--root=#{current_path.join(fetch(:drupal_root))}", '--locale=hu', '--account-name=offiadmin', '--account-pass=1234', '--account-mail=info@macroweb.hu', '--site-mail=info@macroweb.hu', '-y', 'mds_config'
          execute :drush, 'config:set', '-y', 'system.site', 'uuid', '508cad33-2416-4917-af59-7bcd5889da43'
          execute :drush, 'config:set', '-y', 'language.entity.hu', 'uuid', 'c2e5cc7e-5106-4a88-9e8f-87b40df449e7'
          execute :drush, 'config:import', '-y'
          execute "#{current_path.join('build/import.sh')}"
        end
      end
    end


    task :offline do
      on roles(:app) do
        if test("[[ -d #{current_path} -a -f #{shared_path.join('vendor/bin/drupal')} ]]") then
          within current_path.join(fetch(:drupal_root)) do
            #execute :drupal, 'site:maintenance', 'on'
            execute :drush,  'state:set', 'system.maintenance_mode', 'TRUE'
          end
        end
      end
    end

    task :online do
      on roles(:app) do
        within release_path.join(fetch(:drupal_root)) do
          #execute :drupal, 'site:maintenance', 'off'
          execute :drush, 'state:set', 'system.maintenance_mode', 'FALSE'
        end
      end
    end
  end

  task :update do
    on roles(:app) do
      within release_path.join(fetch(:drupal_root)) do
        #execute :drupal, 'update:execute'
        execute :drush, 'updb', '-y'
        # The update sometimes trying to re-enable the site, keep off
        #execute :drupal, 'site:maintenance', 'on'
        execute :drush,  'state:set', 'system.maintenance_mode', 'TRUE'
        execute :drush,  'config:import', '-y'
        execute :drush,  'locale:check'
        execute :drush,  'locale:update'
        %w[hu de].each do |lang|
          execute :drush, 'langimp', "--langcode=#{lang}", "profiles/custom/macroweb-config-profile/translations/#{lang}.po"
        end
        #execute :drupal, 'cache:rebuild'
        execute :drush, 'cache:rebuild'
        execute :drush,  'config:import', '-y'
      end
    end
  end

  namespace :cache do
    task :clear do
      on roles(:app) do
        within release_path.join(fetch(:drupal_root)) do
          #execute :drupal, 'cache:rebuild'
          execute :drush, 'cache:rebuild'
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
        dirs = capture(:ls, '-xd', releases_path.join('*/web/sites/default')).split.find_all { |dir| !dir.match(real_current) }
        dirs.each do |default_dir|
          execute :chmod, 'u+w', default_dir
        end
      end
    end

    task :harden do
      on roles(:app) do
        real_current = capture(:readlink, current_path)
        dirs = capture(:ls, '-xd', releases_path.join('*/web/sites/default')).split.find_all { |dir| !dir.match(real_current) }
        dirs.each do |default_dir|
          execute :chmod, 'u-w', default_dir
        end
      end
    end
  end
end

# after 'deploy:updating', 'drupal:set_paths'
# before 'deploy:updated', 'drupal:site:offline'
after 'deploy:updated', 'composer:install'
# after 'deploy:updated', 'drupal:update'
# after 'deploy:published', 'drupal:site:online'
# after 'deploy:published', 'drupal:cache:clear'
# before 'deploy:cleanup', 'drupal:cleanup:unharden'
# after 'deploy:cleanup', 'drupal:cleanup:harden'
