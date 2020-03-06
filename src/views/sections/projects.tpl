<section id="projects" class="container">
    <div class="section-head text-center">
        <h2>Projektek</h2>
        <p class="lead">
            Ha időm engedi, szívesen kódolgatok, illetve a munkám során is néha melléktermékként kipotyog itt-ott
            pár forráskód. <br />
            Engedd meg, hogy bemutassak pár olyan projektet, amin aktívan dolgoztam, vagy dolgozom a mai napig is.
            Ahol nyílt forrású szoftverről van szó, ott a forráskódra mutató linket is megtalálhatod.
        </p>
    </div>
</section>

<div class="album py-5 bg-light">
    <div class="container">
        <div class="row">
            {foreach from=$projects item=project}
            <div class="col-md-4">
                <div class="card mb-4 shadow-sm">
                    <figure style="padding: 5px 0;">
                        <img src="img/{$project.image_path}" width="350"/>
                    </figure>
                    <div class="card-body">
                        <p class="card-text">{$project.title}</p>
                        <p class="card-details d-none">
                            {$project.description}
                        </p>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group">
                                <a href="#" class="btn btn-sm btn-primary" rel="details"><i class="fas fa-search"></i> Részletek</a>
                                {if !empty($project.repo_url)}
                                <a href="{$project.repo_url}" target="_blank"
                                   class="btn btn-sm btn-outline-secondary"><i class="fab fa-{$project->repoIcon()}"></i> {$project->repoText()}</a>
                                {/if}
                                {if !empty($project.website)}
                                <a href="{$project.website}" target="_blank"
                                   class="btn btn-sm btn-outline-secondary"><i class="fa fa-globe"></i> {$project->siteHost()}</a>
                                {/if}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            {/foreach}
            <!--div class="col-md-4">
                <div class="card mb-4 shadow-sm">
                    <figure style="padding: 5px;">
                        <img src="img/projects/qt.svg" width="350" style="border: 1px solid black" />
                    </figure>
                    <div class="card-body">
                        <p class="card-text">
                            Fordítási projekt: Qt alkalmazásframework
                        </p>
                        <p class="card-details d-none">
                            A VirtualBox projekt fordítása kapcsán jött szembe a Qt projekt, melyre a VirtualBox mint keretrendszer épít, és rengeteg
                            szöveget kellett ebből lefordítani ahhoz, hogy ne legyenek kevert nyelvű ablakok a VirtualBoxban. Miután a VirtualBox fordítása
                            (az akkori verzióé, amin dolgoztam) lezárult, kipótoltam a hiányzó szövegeket a Qt-ban, és leadtam a fordítást a Nokiának.
                            A fordításért felelős csapat vezetője mindenben a segíségemre volt, így hamarosan a Qt keretrendszer felhasználóinak is a rendelkezésére
                            állt egy teljes értékű magyar fordítás. A későbbiekben ezt a projektet a Nokia (vagy az Oracle, ezt már nem tudom) átadta egy másik csapatnak.
                        </p>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group">
                                <a href="#" class="btn btn-sm btn-primary" rel="details"><i class="fas fa-search"></i> Részletek</a>
                                <a href="https://www.qt.io/" target="_blank"
                                   class="btn btn-sm btn-outline-secondary"><i class="fa fa-globe"></i> Qt.io</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div-->
        </div>
    </div>
</div>
