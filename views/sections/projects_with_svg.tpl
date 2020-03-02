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
                        <!-- Official Qt logo, copied from https://qt.io/, all rights belong to Qt project -->
                        <svg width="340px" height="215px" viewBox="0 0 56 42" version="1.1"
                             xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                            <defs>
                                <polygon id="path-1"
                                         points="55.8857143 41.9998839 55.8857143 0.174270968 3.80952383e-05 0.174270968 3.80952383e-05 41.9998839 55.8857143 41.9998839">
                                </polygon>
                            </defs>
                            <g id="Symbols" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                <g id=".A/Component/.c-navigation" transform="translate(0.000000, -67.000000)">
                                    <g id="Nav">
                                        <g id="Logo" transform="translate(0.000000, 67.000000)">
                                            <g id="Page-1">
                                                <path
                                                        d="M20.9078947,10.7234043 C18.7032164,10.7234043 17.1827485,11.4716796 16.3464912,12.9879217 C15.5292398,14.5041638 15.1111111,16.9065214 15.1111111,20.2343774 C15.1111111,23.542542 15.5102339,25.9252082 16.3084795,27.342993 C17.1067251,28.7607778 18.6461988,29.4893617 20.9078947,29.4893617 C23.1695906,29.4893617 24.6900585,28.7804693 25.4883041,27.3823759 C26.2675439,25.9842826 26.6666667,23.6016164 26.6666667,20.2737604 C26.6666667,16.9262129 26.2675439,14.5041638 25.4502924,12.9879217 C24.6330409,11.4716796 23.1125731,10.7234043 20.9078947,10.7234043"
                                                        id="Fill-1" fill="#41CD52"></path>
                                                <g id="Group-5">
                                                    <mask id="mask-2" fill="white">
                                                        <use xlink:href="#path-1"></use>
                                                    </mask>
                                                    <g id="Clip-4"></g>
                                                    <path
                                                            d="M40.8000381,32.4774968 C38.8000381,32.4774968 37.4286095,32.0129806 36.6855619,31.0839484 C35.9428952,30.1549161 35.5619429,28.3934323 35.5619429,25.8000774 L35.5619429,17.4387871 L32.857181,17.4387871 L32.857181,14.1097548 L35.5619429,14.1097548 L35.5619429,8.88394839 L39.3905143,8.88394839 L39.3905143,14.1097548 L44.2667048,14.1097548 L44.2667048,17.4579484 L39.3905143,17.4579484 L39.3905143,25.374271 C39.3905143,26.8450452 39.5048,27.8127871 39.7143238,28.2774968 C39.9236571,28.7613677 40.4762286,28.9936258 41.3333714,28.9936258 L44.2286095,28.8773032 L44.3998476,32.0129806 C42.8381333,32.3224645 41.6379429,32.4774968 40.8000381,32.4774968 L40.8000381,32.4774968 Z M29.7714667,36.2321419 L26.1333714,37.9549161 L22.9905143,32.7095613 C22.5333714,32.8450452 21.8286095,32.9226581 20.8381333,32.9226581 C17.1619429,32.9226581 14.5905143,31.9162065 13.1428952,29.9031097 C11.6952762,27.8904 10.9714667,24.6968516 10.9714667,20.3611742 C10.9714667,16.0063355 11.7143238,12.774271 13.1809905,10.6645935 C14.6476571,8.55472258 17.2000381,7.49020645 20.8381333,7.49020645 C24.4762286,7.49020645 27.0286095,8.53556129 28.4762286,10.6452387 C29.9428952,12.7355613 30.6667048,15.9678194 30.6667048,20.3420129 C30.6667048,23.2256903 30.3619429,25.548271 29.7714667,27.3097548 C29.1617524,29.0904 28.1905143,30.4452387 26.8190857,31.374271 L29.7714667,36.2321419 Z M50.5143238,0.174270968 L48.5714667,0.174270968 L7.75241905,0.174270968 L3.80952383e-05,8.05169032 L3.80952383e-05,34.3934323 L3.80952383e-05,36.5420129 L3.80952383e-05,41.9998839 L5.37146667,41.9998839 L7.31432381,41.9998839 L48.1333714,41.9998839 L55.8857524,34.1226581 L55.8857524,7.78052903 L55.8857524,5.63233548 L55.8857524,0.174270968 L50.5143238,0.174270968 Z"
                                                            id="Fill-3" fill="#41CD52" mask="url(#mask-2)"></path>
                                                </g>
                                            </g>
                                        </g>
                                    </g>
                                </g>
                            </g>
                        </svg>
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