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
            <div class="col-md-4">
                <div class="card mb-4 shadow-sm">
                    <figure style="padding: 66px 0;">
                        <img src="img/sc4.jpg" width="348"/>
                    </figure>
                    <div class="card-body">
                        <p class="card-text">SimCity 4 Starter</p>
                        <p class="card-details d-none">
                            Az SC4 Starter egy korai VB.Net-ben írt projektem volt egy elég idegesítő problémára:
                            Windows 7-en a játék nem működött jól, ha
                            nem volt egy konkrét processzorhoz kötve. Mivel az EA Games és a Maxis ezt a játékot
                            egyáltalán nem támogatta már akkoriban, ezért
                            egy körülményesebb megoldáshoz kellett folyamodnom. Ez a launcher elindítja a játékot,
                            majd rögtön be is állítja a processor affinity-jét,
                            illetve egy registry kulcs segítségével a felbontás is konfigurálható lett (a játék
                            alapból nem ad erre lehetőséget)
                        </p>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group">
                                <a href="#" class="btn btn-sm btn-primary" rel="details"><i class="fas fa-search"></i> Részletek</a>
                                <a href="https://github.com/hron84/SC4Starter" target="_blank"
                                   class="btn btn-sm btn-outline-secondary"><i class="fab fa-github"></i> GitHub</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card mb-4 shadow-sm">
                    <figure style="padding: 25px 0;">
                        <img src="img/virtualbox-logo.png" width="350" />
                    </figure>
                    <div class="card-body">
                        <p class="card-text">
                            Fordítási projekt: VirtualBox grafikus felület
                        </p>
                        <p class="card-details d-none">
                            2012-ben elkezdtem komolyabban használni a VirtualBox nevű asztali virtualizációs szoftvert,
                            hogy a kisebb tesztkörnyezeteimet ebben futtassam. Ekkor vettem észre, hogy a fórumokon nagyon sok
                            nem üzemeltetőként dolgozó ember is használja ezt a szoftvert, sőt, később megtudtam, hogy
                            néhány cégnél bizony végfelhasználók is ebben futtatnak olyan alkalmazásokat, melyek működése
                            speciális szoftverkörnyezetet vagy operációs rendszert igényel. Ekkor merült fel bennem az ötlet,
                            hogy jó lenne, ha ez a szoftver legalább alapszinten tudna magyarul, ezzel megkönnyítve azok számára
                            a használatot, akiknek a munkájában nem elsőrangú szempont az idegen nyelvek ismerete. Kezdetben egyedül,
                            később kiváló segítőtársammal, Tom Evinnel közösen elértük, hogy a VirtualBox ma már szinte teljesen magyarul
                            kommunikál a felhasználóval (amennyiben a megfelelő nyelv ki van választva), és bár én idő hiányában már
                            csak konzulensként veszek részt a fordításban, mégis büszke vagyok rá, hogy az én munkám is közrejátszott abban,
                            hogy a VirtualBox hazánkban igen nagy népszerűségnek örvend, hiszen a piacon egyedülálló módon tud magyarul.
                        </p>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group">
                                <a href="#" class="btn btn-sm btn-primary" rel="details"><i class="fas fa-search" ></i> Részletek</a>
                                <a href="https://www.virtualbox.org/" target="_blank"
                                   class="btn btn-sm btn-outline-secondary"><i class="fa fa-globe"></i> VirtualBox.org</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card mb-4 shadow-sm">
                    <figure style="padding: 5px;">
                        <img src="img/qt.svg" width="350" />
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
            </div>
        </div>
    </div>
</div>
