<section id="companies" class="container">
    <div class="section-head text-center">
        <h2>Referenciák</h2>
        <p class="lead">
            Karrierem során elég sok környezetet láttam, elég sok cégnél megfordultam. Sokan ezt csapongásnak tartják, én tapasztalatszerzésnek.
            Nem lennék olyan jó rendszergazda, nem lennének ennyire átfogó ismereteim, ha nem láttam volna ennyi különféle környezetet.<br/><br/>
            A következőkben a teljesség igénye nélkül mutatok be pár céget, ahol dolgoztam. Ezek a cégek valamiért fontosak voltak, formálták a szemléletem,
            vagy csak segítettek egy-két technológiában elmerülni. Ha a többi hely is érdekel, ahol dolgoztam, kérlek kattints a LinkedIn ikonra
            lent a kapcsolat menüben, ott egy teljes tapasztalati listát kaphatsz. Vagy töltsd le a PDF-es önéletrajzomat szintén arrafelé!
        </p>
    </div>
</section>


<div class="album py-5 bg-light">
    <div class="container">
        <div class="row">
            {foreach from=$companies item=company}
            <div class="col-md-4">
                <div class="card mb-4 shadow-sm">
                    <figure style="">
                        <img src="img/{$company.image_path}" />
                    </figure>
                    <div class="card-body">
                        <p class="card-text">{$company.name} &bull; {$company->range()}<br/> {$company.short_desc} </p>
                        <p class="card-details d-none">
                            {$company.long_desc}
                        </p>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group">
                                <a href="#" class="btn btn-sm btn-primary" rel="details"><i class="fas fa-search"></i> Részletek</a>
                                <a href="{$company.url}" target="_blank"
                                   class="btn btn-sm btn-outline-secondary"><i class="fa fa-globe"></i> {$company->buttonText()}</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            {/foreach}
        </div>
    </div>
</div>
