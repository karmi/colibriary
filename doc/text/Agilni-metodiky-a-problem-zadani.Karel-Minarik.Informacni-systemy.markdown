Agilní metodiky vývoje software a problém zadání
================================================

> A complex system that works is invariably found to have evolved from a simple system that worked.
> — [John Gall](http://en.wikipedia.org/wiki/Gall's_law)

---

Abstract:
This text deals with some major shifts in project management methodologies in current software development. During the last couple of years, an increasing abandonment of traditional „waterfall“ and formal approaches to project management has been observed both in literature and day-to-day development. These „agile methodologies“ turn some of long-held principles on its head and propose radically different approach. The author describes these theoretical and practical differences, while focusing on the problem of requirements documentation, project specification and testing. As a pratical part of this text, a simple web application has been developed to demonstrate one of the recently emerged tools for capturing project specification and acceptance testing: _Cucumber_.

---

V posledních několika letech došlo k radikální proměně náhledu na principy projektového řízení v oblasti vývoje software. Vývoj software jako takový je přitom poměrně mladá disciplína: sklizeň úrody, stavba mostů či sériová výroba automobilů jsou tradiční a časem prověřené příklady vysoce organizovaných činností, které vyžadují kooperaci, plánování a odhad náročnosti. Není proto divu, že tvůrci raných metodik pro vývoj software nalezli inspiraci zejména ve stavebnictví a průmyslové výrobě (viz Vlasák, 2003, s. 9).


## Tradiční metodologie řízení softwarových projektů ##

Tradiční metodika vývoje předpokládá, že projekt postupně a předvídatelně postupuje etapami získání požadavků zadavatele, analýzy a návrhu, implementace, testování a údržby (viz Vlasák, 2003, s. 28). Zdá se to logické: nejprve zjistíme, co je třeba vytvořit, pak navrhneme celý systém, naprogramujeme potřebnou funkcionalitu, pak ji otestujeme a předáme do provozu. Tento přístup, označovaný jako „vodopádový model“ (_waterfall_), odpovídá běžné představě o vývoji software a dobře odpovídá metodice používané kupříkladu ve stavebnictví. Často také poskytuje dobré vysvětlení, proč došlo k chybám: na vině je ve většině případů „nedostatečná analýza“.

V současné době je vodopádový model vývoje nejkritizovanější, případně rovnou nejvysmívanější metodikou vývoje software. Jakkoliv je idea „dvakrát měř, jednou řež“ srozumitelná a zdánlivě intuitivní, v praxi lze netriviální _softwarový_ projekt podobným způsobem řídit a vytvořit jen s velkými obtížemi. „Slabými místy tohoto přístupu jsou kromě dlouhé doby od specifikace požadavků na systém po implementaci také malá pružnost informačního systému a nedostatečné zapojení budoucích uživatelů do procesu jeho vývoje“ (tamtéž).

Paradoxně již jeden z prvních formálních popisů takto strukturované či „etapizované“ metodiky od Winstona Royce uvádí, že její naivní uplatnění je „riskantní“ a vysloveně si „říká o selhání“ (Royce, 1970, s. 329).

> Testovací fáze, která se objevuje až na konci vývojového cyklu, je prvním místem, kde se čas,
> úložiště, koordinace vstupu/výstupu, atd. skutečně projeví, a nejsou jen analyzovány.
> **Tyto fenomény nelze přesně analyzovat.**
> Nejsou podobného typu jako kupříkladu řešení parciálních diferenciálních rovnic
> matematické fyziky.
>
> (Royce, 1970, s. 329, zvýr. KM)

Celý zbývající článek věnuje Royce popisu způsobů, jak eliminovat rizika naivně procedurálního postupu od analýzy k předání do provozu; žádný projekt nepostupuje neproblematicky z jedné fáze do druhé: nedostatek zjištěný ve fázi testování si může vyžadovat nejenom zásah ve fázi implementace (jako např. oprava chyby), ale též ve fázi návrhu či získávání požadavků. Jako řešení navrhuje Royce vytvořit „předběžný návrh programu“ a klást důraz na _rozsáhlejší dokumentaci_ a těsnější zpětnou vazbu mezi jednotlivými fázemi (tamtéž, s. 331 a 332nn.). Jako poslední ze způsobů snížení rizik navrhuje participaci zákazníka, neboť, jak zní jeho neodolatelná formulace (tamtéž, s. 335):

> Z nějakého důvodu je to, co má návrh software skutečně dělat, otevřeno volné interpretaci i přes předchozí dohodu.

Říkáme, že je to paradoxní, neboť téměř celá následující historie projektového řízení v oblasti vývoje software spočívá ve vyvracení, přepracovávání či doplňování „vodopádové“ metodiky — a to většinou za pomoci těch samých nástrojů, které zmiňuje a navrhuje Royce. „Vodopádový“ model je (oprávněně) kritizován za to, že se snaží postihnout požadavky „dopředu“ v analytické fázi, že se špatně vyrovnává se změnami v zadání nebo implementačními problémy a že posiluje svalování viny za nedostatky z jedné fáze na druhou. Všechny dominantní metodiky současnosti obsahují koncept „prototypového“ či „iterativního“ přístupu, tedy vývoje v cyklech, se zpětnou vazbou mezi implementací a návrhem a implementací a požadavky zadavatele. Nejznámější formální metodikou tohoto typu je _Rational Unified Process_, vytvořený společností IBM, který pracuje s prolínáním jednotlivých fází (viz RUP).

Jeden z kontroverzních, přesto široce a v současnosti stále častěji používaných přístupů, _agilní metodika pro vývoj software_, volí přesně opačný přístup. Převrací na hlavu celou filosofii projektového řízení, tak jak ji chápou „vodopádové“ i formalistní iterativní metodiky. Vychází přitom z postřehu, který jsme viděli již v „zakladatelském“ texu Winstona Royce: _„Tyto fenomény nelze přesně analyzovat“._

Podobné diktum — „to, co má navrhovaný software dělat, nelze přesně analyzovat“ — nalezneme v nespočtu základních textů v dějinách výpočetní techniky, za všechny kupříkladu v „kultovním“ textu _No Silver Bullet_ z roku 1986 Fredericka Brookse (Brooks, 1995, s. 199n., zvýr. KM):

> Ta _nejsložitější část při budování informačního systému_ je rozhodnout se, co přesně vlastně vybudovat.
> Žádná jiná součást celé koncepční práce není tak složitá, jako stanovení detailních technických požadavků (...)
> Žádná jiná součást natolik neohrozí celý systém, je-li provedena nesprávně.
> Žádnou jinou součást nelze tak obtížně napravit později.
> Protože pravdou je, že zákazníci nevědí, co vlastně chtějí (...)
> A šel bych ještě o krok dál, a tvrdil, že je skutečně nemožné, aby zákazník, i když 
> pracuje se softwarovým inženýrem, specifikoval úplně, přesně a správně exaktní požadavky
> moderního softwarového produktu předtím, než měl možnost vyzkoušet alespoň nějaké
> verze tohoto produktu, který se snaží specifikovat.

_„Tyto fenomény nelze přesně analyzovat“_, se vrací jako ozvěna. Brooksův esej pokračuje (Brooks, 1995, s. 200):

> Pokud je tomu tak, jak věřím, že pojmové struktury, které dnes vytváříme, jsou příliš složité na to,
> abychom je byli schopni přesně specifikovat dopředu, a příliš složité na to, abychom je vytvořili bez chyb,
> pak musíme radiálně změnit přístup.

Brooks naznačuje: jestliže je tomu skutečně tak, jestliže je _nemožné_ dopředu analyzovat a v úplnosti specifikovat funkce komplexních informačních systémů, aplikací a ostatního software, nebylo by lepší než se snažit tomuto faktu neustále vzdorovat _lepším_ plánováním, _důkladnější_ analýzou a _podrobnější_ dokumentací, jej přijmout a obrátit ve svůj prospěch? Nechat software „růst“, místo toho jej „stavět“ („Grow, not build, software“, Brooks, 1995, s. 200).

A právě taková je pozice zastánců agilních metodik: jestliže nelze dopředu _v úplnosti_ specifikovat funkce aplikace, budeme specifikovat pouze ty funkce, u nichž jsme toho schopni. Jestliže v průběhu vývoje nevyhnutelně dochází ke změnám, musíme tomu proces vývoje přizpůsobit, nikoliv změnám zabraňovat. Jestliže zákazník „neví co chce“, dokud nemá možnost pracovat s funkční verzí aplikace, zaměřme se na to, dodávat mu pravidelně a v krátkých cyklech plně funkční aplikaci, byť omezenou co do rozsahu funkcionality.


## Manifest agilního vývoje ##

Za zakládající dokument agilního přístupu či metodiky vývoje software můžeme považovat _The Agile Manifesto_, společný dokument, vypracovaný v roce 2001 skupinou předních teoretiků a vývojářů (viz Agile Manifesto, Authors), který je ve shodě s agilní filosofií tak stručný, že jej můžeme ocitovat v jeho úplnosti:

> Manifest agilního vývoje software

> My, níže podepsaní, objevujeme lepší způsoby, jak vyvíjet software
> tím, že je využíváme v naší práci, a pomáháme ostatním je využívat také.
> 
> Díky této práci jsme dospěli k tomu, že:
>
> **Jednotlivci a komunikace** jsou cennější než procesy a nástroje
> 
> **Fungující software** je cennější než obsáhlá dokumentace
> 
> **Spolupráce se zákazníkem** je cennější než vyjednávání o smlouvě
> 
> **Reagování na změny** je cennější než následování plánu
>
> Tedy, jakkoliv uznáváme hodnotu toho, co je uvedeno na pravé straně,
> ceníme si více toho, co je uvedeno na straně levé.


Vidíme z něj jednoznačnou orientaci na pragmatický, empirický přístup („objevujeme lepší způsoby (...) _tím, že je využíváme“; srov. Chelimsky, 2010, s. 97) a nedogmatické pojetí: „jakkoliv uznáváme hodnotu ... ceníme si více“. Čtyři zásady, které postuluje, velmi pregnantně shrnují revoluční změnu v přístupu agilní metodiky k problémům projektového řízení.

#### _Jednotlivci a komunikace jsou cennější než procesy a nástroje_ ####

Tradiční metodika vývoje je zaměřena a do značné míry fascinována _procedurálními aspekty_ projektu: procesy, pravidly, předpisy, směrnicemi — ve shodě se shora nastíněnou inspirací v průmyslové výrobě. Jakkoliv je určitá míra organizace jakéhokoliv projektu nevyhnutelná, „organizace“ se může snadno zvrhnout v „byrokracii“, která brání bezprostřední komunikaci. Agilní metodika trvale brání běžnou  komunikaci „tváří v tvář“ před jejím „úřednickým pojetím“.

#### _Fungující software je cennější než obsáhlá dokumentace_ ####

Zde se agilní metodiky nejvíce odchylují od metodik tradičních, které na _obsáhlou_ dokumentaci kladou téměř absolutní důraz (viz Royce, 1970, s. 332: „Prvním pravidlem řízení softwarového projektu je nelítostné vyžadování dokumentace požadavků“). Proč je funkční software cennější než dokumentace, resp. specifikace? Vzpomeňme na shora citované vyjádření Winstona Royce: „Z nějakého důvodu je to, co má návrh software skutečně dělat, otevřeno volné interpretaci i přes předchozí dohodu“ (Royce, 1970, s. 335).

Software naproti tomu buď _dělá_ co má, nebo _nedělá_ co má. Prostor pro interpretaci je značně omezený. Funkční software je _hmatatelný_, na rozdíl od abstraktní specifikace či dokumentace; na základě _používání_ předané aplikace může zadavatel mnohem lépe specifikovat, jaké funkce jsou implementovány nedostatečně či jinak než zamýšlel. Případně zcela změnit zadání konkrétní funkcionality.

Agilní metodiky kladou důraz na _rychlost_ a pravidelnost podobné zpětné vazby dané _použitím_ aplikace: doporučená délka jednoho vývojového cyklu („iterace“) je dva až čtyři týdny.

Takové pojetí vývojového cyklu však pozitivně ovlivňuje i ostatní aspekty projektu: jestliže vývojáři prezentují _zcela funkční_ software každé dva týdny, vyžaduje to sofistikovanou infrastrukturu a především _automatizaci_ testovacího procesu, procesu nasazení aplikace do produkce, integrace s ostatními systémy, a podobně (srov. Chelimsky et al., 2010, s. 99). Agilní metodika se tak předem brání tzv. „integraci stylem velkého třesku“ (angl. _Big Bang Integration_), problematické integraci jednotlivých součástí složitějšího systému, kdy jsou jednotlivé moduly testovány „až nakonec“, při jejich „finální“ integraci.

A konečně, fungující software je _skutečným_ měřítkem toho, jak se projektu daří („Fungující software je základním měřítkem pokroku“; Agile Manifesto, Principles). Z toho, jakým tempem je tým schopen dodávat _fungující_ software lze mnohem úspěšněji vyvozovat, jaký je jeho skutečný pokrok, než kupříkladu z analýzy kritické cesty (viz Critical Path Method) či jiné abstraktní metody extrapolace.

#### _Spolupráce se zákazníkem je cennější než vyjednávání o smlouvě_ ####

Díky sebevědomí, plynoucímu z toho, že je tým zpracovávající projekt schopen pravidelně dodávat _fungující software_, je též možné vzdát se části ochrany poskytované smlouvami či funkční specifikací. Výhodou podobně otevřeného vztahu je to, že zapojuje zadavatele do projektu a činí ho spoluzodpovědným za jeho úspěch či neúspěch. (Agilní metodiky pochopitelně disponují množstvím nástrojů, jak zabránit _destruktivnímu_ zasahování do průběhu projektu ze strany zákazníka, jako je např. pravidlo neměnit ani nedoplňovat zadání _během_ iterace, ale jedině před tím, než započne.)

#### _Reagování na změny je cennější než následování plánu_ ####

V tomto bodě působí agilní metodiky zcela proti běžnému chápání projektového řízení. _Změna_ je v jeho pojetí vždy synonymem pro _hrozbu_, znamená zvýšenou ostražitost a větší či menší míru manévrování, jehož cílem je primárně změně _zabránit_. Změna v zadání, specifikaci či architektuře je však u netriviálního softwarového projektu, který trvá nezanedbatelnou dobu, nejen pravděpodobná, ale _jistá_. Agilní metodiky zde převracejí běžné pojetí na hlavu: nelze-li se změně vyhnout, _přijměme_ ji a začleňme ji jako běžnou součást projektu. Koneckonců, bránit změně má svůj dobrý smysl kupříkladu na stavbě, neboť ztuhlý železobeton lze „měnit“ jen za cenu bourání a jakákoliv podobná „změna“ je zpravidla velmi drahá. Software je však ze své podstaty _nehmotný_ a jeho změna nesrovnatelně snazší (srov. Chelimsky et al., 2010, s. 96).

Agilní metodiky se s problémem změny vyrovnávají mnohem lépe než metodiky tradiční zejména díky krátkému vývojovému cyklu: potenciálně destruktivní vliv požadavku na změnu funkcionality je omezen tím, že přichází velmi záhy po její implementaci, nikoliv po několika měsících, kdy je projekt již v úplně jiném stadiu a tým se zabývá jiným okruhem funkcionality. Negativní vliv změny je rovněž limitován tím, že výsledkem každé iterace je _fungující software_, což omezuje prostor pro „frivolní“ požadavky či změny, které nepřináší hodnotu pro funkci aplikace, a které si zadavatel vymýšlí „do zásoby“.

„Změna“ je z pohledu agilních metodik vítané _upřesnění zadání_ na základě reálné zkušenosti s fungující aplikací. Cílem celého projektu je přece vytvořit _fungující software_, který řeší skutečné, nikoliv imaginární zadání.

Aforisticky řečeno, tradiční metodice se může snadno stát, že pro samé soustředění na _les_ nevidí _stromy_. Ale les, přece, řekli by zastánci agilních metodik, dělají právě: _stromy_. Bez stromů není les.


## Problém zadání ##

Při expozici problémů, s nimiž se vyrovnávají tradiční metodiky, jsme viděli, že jedno téma se objevuje znovu a znovu: nespolehlivost specifikace. _„Tyto fenomény nelze přesně analyzovat.“_ Agilní metodiky se proti tomu nesnaží bojovat silou (_přesnější_ specifikací, _podrobnější_ smlouvou, atd.), ale flexibilitou celého procesu — a v neposlední řadě i samotnou _formou_ specifikace.

### _User stories_ ###

Většina agilních metodik (např. dominantní metodika, _Scrum_) přichází se specifickou formou specifikace projektu: tzv. _user stories_ — „příběhy“ o interakci uživatele s aplikací, části systému s jinou, apod. V čem se tyto „scénáře“ liší od tradiční formální specifikace zadání softwarového projektu (srov. IEEE 830) či od zavedených forem typu _případů užití_ (srov. Use Case)?

V první řadě tím, že se nesnaží postihnout _celek_ projektu či systému. Záměrně a cílevědomě opouštějí představu, že architekt či analytik je schopen před započetím práce na projektu zjistit _v úplnosti_ požadavky klienta a převést je do formálního zápisu specifikace. Agilní přístup ke specifikaci postupuje podobně, jako řídíme-li automobil v mlze: svoji rychlost musíme přizpůsobit viditelnosti. Jedeme jen tam, kam vidíme.

To však není jediný rozdíl. Jak pregnatně shrnuje Mike Cohn v knize _User Stories Applied_:

> Jakmile uživatelé spatří software, který je pro ně vytvářen, nastane **efektivní a důležitá zpětná vazba**:
> začnou přicházet s novými nápady a uvědomovovat si, co by chtěli změnit na nápadech starých.
> Když uživatel požaduje změnu systému, tak jak byl popsán ve specifikaci, zvykli jsme si nazývat to „změnou
> funkcionality“.
> Takové myšlení je nesprávné, a to ze dvou důvodů. Zaprvé, takový přístup se tváří, že v určitém momentu byla tato
> funkcionalita známa dostatečně dobře, abychom ji byli schopni v úplnosti popsat (...)
> Zadruhé, tento způsob uvažování **posiluje představu, že software je hotový, když splňuje seznam požadavků**, nikoliv,
> že je hotový, když splňuje potřeby svých uživatelů.
>
> (Cohn, 2004, s. 134, zvýr. KM)

Specifikace ve formě _user stories_ se tedy nesnaží dopředu vystihnout požadovanou funkcionalitu a tu pak kodifikovat ve formě specifikace nikoliv proto, že by to prostě „nebylo možné“. V mnoha případech to skutečně možné není, ale takový argument je pouze empirický: existují případy, kdy to možné je.

Mnohem důležitější je, že takový přístup brání zmíněné „efektivní a důležité zpětné vazbě“, která vzniká, jakmile může uživatel reálně pracovat s funkční aplikací. Teprve tehdy dochází i technicky zběhlým uživatelům nebo analytikům, co je logický další krok ke kýžené funkci — nebo o _jakou_ funkci se vlastně jedná. A hlavním smyslem vývoje je právě: dodat software, který je _užitečný_, který plní požadovné funkce, nikoliv imaginární zadání.

Tradiční specifikace kromě problému s nepostihnutelností celku systému trpí mnoha dalšími neduhy. Jedním z nich je problém týkající se _komunikace_. Tradiční, vysoce formalizovaná specifikace zpravidla není srozumitelná běžnému uživateli systému či zákazníkovi — a leckdy ani samotným vývojářům. Díky snaze postihnout vyčerpávajícím způsobem celek je většinou rozsáhlá (desítky či stovky stran) a nelze ji využít pro běžnou komunikaci o rozsahu a funkcionalitě projektu. Navozuje však fatální iluzi, že všichni na projektu zainteresovaní problémům rozumí — vždyť jsou přece popsány ve specifikaci.

To lze nejlépe osvětlit na příkladu. Uvažujme imaginární systém pro evidenci knih a jejich výpůjček. Je zjevné, že ústřední funkcionalita se vyjma vkládání záznamů o knihách do systému, jejich vyhledávání, apod. bude týkat půjčování knih. Ve formě _user story_ bychom tuto funkcionalitu mohli popsat takto a _jenom_ takto:

    Knihovník provede zápujčku knihy čtenáři.

Nic více? Kde je specifikována kontrola, zda čtenář nemá propadlý průkaz? Kde je specifikována kontrola, zda se nejedná o prezenční výtisk? Kdy a jak zadá knihovník délku výpujční doby?

Je zjevné, že uvedený formát specifikace popisuje funkcionalitu _velmi_ vágně a neúplně. To je však jeho smyslem. _User story_ slouží primárně jako nástroj _komunikace_ mezi týmem a zákazníkem či uživatelem. Otázky, které jsme uvedli, vyplynou téměř okamžitě jen z letmé diskuse o tématu se zainteresovanými uživateli.

Místo doplňování původního scénáře do monolitické formy pak na základě takové diskuse sepíšeme scénáře další:

    Při zapůjčování knihy musí knihovník uvést číslo platného čtenářského průkazu.

    Prezenční výtisk knihy nelze zapůjčit.

    Při zapůjčení knihy se zaznamená datum vypůjčky.

Výhodou je, že funkcionalita je rozdělena do nezávislých a elementárních celků, které lze velmi snadno pochopit a konverzovat o nich. Lze si představit, že v jednom vývojovém cyklu implementujeme jen _první_ scénář s tím, že nebudeme ověřovat ani platnost průkazu, ani určovat délku výpůjční doby. Uložíme zkrátka záznam o transakci „tento čtenář si vypůjčil tuto knihu“, a v dalších vývojových cyklech můžeme funkcionalitu rozšiřovat dle dodatečně doplněných scénářů.

Důraz je přitom kladen na to, aby scénář vždy popisoval _ucelenou_, byť i _neúplnou_ funkcionalitu systému, a sloužil jako vodítko konverzace. Díky „zpětné vazbě“ dané použitím aplikace či systému pak můžeme postupovat ke scénářům dalším.

Tento aspekt _user stories_ vynikne zejména ve srovnání s velmi podobnou technikou tzv. _use cases_ („případy užití“). Rovněž ony se snaží o popis funkcionality z pohledu uživatele a zaměřují se na reálnou užitnou hodnotu dané funkcionality.

Typická formulace „případu užití“ pro náš příklad s knihovnou by mohla vypadat například takto:

    Use Case Number: 1
    Use Case Title: Zapůjčení knihy
    Use Case Description: Knihovník provede zápůjčku knihy čtenáři.
    Primary Actor: Knihovník
    Preconditions: Systém obsahuje databázi výtisků knih a čtenářů.
    Success Guarantees: Výtisk knihy je evidován jako zapůjčený. U záznamu o výpůjčce je evidováno datum.

    Main Success Scenario:
    1. Knihovník vyplní číslo průkazu čtenáře.
    2. Knihovník klikne na tlačítko „Zapůjčit“.

    Extensions:
    1a: Knihovník nevyplní číslo průkazu:
      1a1: Záznam o výpůjčce se neuloží.
      1a2: Aplikace zobrazí chybovou zprávu.
    1b: Knihovník vyplní neplatné číslo průkazu:
      1b1: Záznam o výpůjčce se neuloží.
      1b2: Aplikace zobrazí chybovou hlášku.
    2a: Výtisk knihy je prezenční:
      2a1: Záznam o výpůjčce se neuloží.
      2a2: Aplikace zobrazí chybovou hlášku.


Případ užití na rozdíl od _user story_ většinou do nějaké míry zahrnuje popis rozhraní aplikace (viz Cohn, 2004, s. 139); to může návrh rozhraní spíše komplikovat než usnadňovat, neboť rozhraní lze efektivněji specifikovat pomocí diagramu rozložení (_wireframe_) a jeho specifikace ve scénáři by mohla zbytečně omezit jeho možnosti.

Z ukázky však vidíme především to, že se _use case_ snaží postihnout větší komplex funkcionality než _user story_ a bude mít tendenci na sebe „nabalovat“ výjimky, upřesňování, a další informace. Doporučený rozsah pro jednu _user story_ je takový, aby se vešla na kartičku velikosti katalogizačního lístku.

Vzhledem k tomu pak bude _odhadování času_ potřebného na implementaci, druhá klíčová funkce _user stories_, pro jejíž popis nemáme v tomto textu prostor, mnohem přesnější, neboť pracuje s menšími jednotkami funkcionality — a tedy času. Každý scénář dostane určitý počet „bodů“, který se určuje kolektivně a slouží k plánování jednotlivých „iterací“ (viz Cohn, 2004, s. 88; srov. též _Planning Poker_).

Jeden důležitý rozdíl _user stories_ oproti jiným, formalizovanějším způsobům zápisu specifikace z příkladu zjevný není: totiž to, že jsou vždy vypracovávány společně s uživatelem, nikoliv v izolaci. To vede k tomu, že jsou psány srozumitelným jazykem, prostým technického žargonu; jestliže zápisu rozumí uživatel, bude mu rozumět i programátor — naopak zpravidla neplatí. Za správnost a užitečnost každé _user story_ je pak zodpovědný nejen analytik či projektový manažer, ale též uživatel a zákazník.


### Akceptační kritéria ###

V agilní metodice je specifikace ve formě _user stories_ zpravidla doprovázena tzv. akceptačními kritérii, která stanovují podmínky, za nichž je scénář považován za úspěšně implementovaný. Podle některých názorů není _user story_ bez akceptačních kritérií úplná: „Akceptační kritéria jsou vnitřní součástí scénáře — to ony skutečně definují rozsah funkcionality a společně sdílenou definici toho, že je ‚hotová‘“ (North, 2007).

V případě našeho knihovního systému jsou takovými kritérii pro scénář „Při zapůjčování knihy musí knihovník uvést číslo platného čtenářského průkazu“:

1. Knihovník zadá číslo platného čtenářského průkazu (_prošlo_)
2. Knihovník zadá číslo neplatného čtenářského průkazu (_selhalo_)
3. Knihovník nezadá číslo čtenářského průkazu (_selhalo_)

Akceptační kritéria nebo též _akceptační testy_ jsou _součástí_ scénáře, neboť jej zpřesňují a doplňují. Samotné ověření, zda je výsledná aplikace nebo systém splňuje, je možné provádět _manuálně_ (přímo v rozhraní aplikace, zapojením systému do testovacího prostředí, apod). To je však pomalé, únavné a náchylné k chybám: člověk pověřený testováním musí procházet akceptační kritéria jedno po druhém a zjištovat, zda jimi software úspěšně prochází.

Závažným důsledkem nepohodlí a neefektivity jakéhokoliv manuálního testování je to, že je prováděno zřídka, pouze v určitých fázích vývoje, a zpravidla jen pro omezený okruh funkcionality.

Postupem času proto vznikly nástroje, které umožňují spuštění akceptačních testů _automatizovat_, tedy provádět mechanicky. Mezi první takové nástroje lze považovat FIT (viz FIT) a FitNesse (viz Fitnesse); oba pracují na principu definice testovacích dat ve zvláštním dokumentu, který pak načte a zpracuje výkonný program, a předá je jako parametry testovanému programu.

Hlavním přínosem mechanizace akceptačních testů však není pouhé zlepšení efektivity provádění testů. Je jím především možnost využít akceptační testy podobně jako automatizované jednotkové testy (angl. _unit test_) během samotného vývoje software, nikoliv až nakonec jako ověření naprogramované funkcionality. Jednotkové testy jsou standardním nástrojem vývojářů pro kontrolu funkce konkrétního algoritmu či součásti programu a mají tyto výhody:

1. Spouští se automaticky, mechanicky ověřují předpoklad a výsledek
2. Běží velmi rychle, neboť omezují a nahrazují závislost jednotlivých součástí programu navzájem, připojení k databázi, webovým službám apod.
3. Lze je spustit kdykoliv dojde ke změně programu a ověřit tak, zda-li nedošlo k zavlečení chyby (tzv. _regression_)
4. Pomáhají testovat běžné i neobvyklé vstupy algoritmu a ověřovat tak jeho chování v nestandardních situacích.

Klíčové je přitom právě to, že jednotkové testy jsou využívány jako nástroj a pomocník v samotné fázi vývoje, nikoliv ve „fázi testování“. Oproti běžné představě, že kód vývojář nejprve napíše a pak jej otestuje, se v současné době využívá technika tzv. vývoje řízeného testy (angl. _test driven development_). Vývojář nejprve napíše _selhávající test_, který specifikuje očekáváné chování části programu, a pak doplní jeho implementaci: tento cyklus se nazývá „červená — zelená — upravit a doplnit“ (angl. _red—green—refactor_; viz Beck, 2003). V tomto smyslu jsou testy nejenom prostým ověřením funkcionality programu, ale pomocníkem jeho správného _návrhu_, neboť eliminují živelné psaní kódu a pomáhají udržet soustředění na podstatné funkce a správnou architekturu a kompozici kódu. Automatizované vývojářské testy slouží rovněž jako ta nejpřesnější _dokumentace_, neboť kód nelže: buď testy prochází, či neprochází. Nenastane pak ten nejzhoubnější problém s dokumentací — to, že se stane neaktuální a falešnou. A konečně, testy jsou nejefektivnější _obranou_ vývojáře proti zavlečení chyb do některé části programu změnou jeho jiné části, při přidávání nových funkcí či při refaktorizaci kódu (viz Krzywda, 2008).

V tradiční metodice a pojetí akceptační testování probíhá jako samostatná fáze, ve smyslu „nejprve software napíšeme a pak jej otestujeme“ — vzhledem k tomu je však vzdálenost mezi implementací funkcionality a jejím ověřením příliš velká, a není proto divu, že agilní metodiky přišly s nástroji jako zmíněné FIT nebo FitNesse, které umožňují automatizované akceptační testy zapojit do samotného procesu vývoje a zkrátit tak zpětnou vazbu mezi testováním a implementací.

Akceptační testy přitom na rozdíl od jednotkových testů používaných vývojáři testují funkcionalitu _celého systému_ z pohledu uživatele, nikoliv jednotlivé moduly odděleně. Proto se jim též říká _black-box testing_ (nezajímá nás „vnitřek“ systému, tedy konkrétní implementace), na rozdíl od _white-box testing_ jednotkových či jednodušších funkčních testů.

### _Cucumber_ ###

Klíčovým principem agilní metodiky je, jak jsme viděli, intenzivní zapojení zákazníka do celého procesu vývoje: např. na autorství specifikace, _user stories_ se podílí stejnou měrou jako tým, který projekt vytváří. Akceptační kritéria jsou jakožto součást příslušné _user story_ psána stejně srozumitelným jazykem. Testy, které využívají programátoři, jsou však pro laika většinou nesrozumitelné. Bylo by tedy velice výhodné, kdybychom mohli _automatizované_ akceptační testy psát přirozeným jazykem, tak, aby se na nich mohli podílet i uživatelé, a přitom je bylo možné mechanicky spouštět a vyhodnocovat.

Právě to je cílem projektu _Cucumber_, který je _zároveň_ metodologií i nástrojem pro akceptační testy. _Cucumber_ vzniknul z projektu _Story Runner_ pro testovací framework _RSpec_ (viz Chelimsky, 2007), který umožňoval psát v přirozeném jazyce akceptační testy pro programy vytvořené v programovacím jazyce Ruby.

Představme si jednoduchou webovou aplikaci, knihovní katalog, která by vypadala zhruba takto:

![Colibriary Screenshot](/karmi/colibriary/raw/master/doc/text/colibriary_screenshot.png)

Zápis testovacího scénáře s akceptačními kritérii pro náš příklad by pak v češtině vypadal takto:

    # language: cs
    Požadavek: Knihovník provede zapůjčku knihy čtenáři
      Aby si čtenář mohl přečíst knihu mimo knihovnu
      knihovník uloží záznam o zápůjčce do systému.

      Scénář: Čtenářka s platným průkazem
        Pokud existuje čtenářka jménem "Marie" s platným průkazem
        A existuje neprezenční výtisk knihy "Kafka: Proměna"
        A jsem na stránce "Knihy"
        Když vyplním číslo průkazu čtenářky jménem "Marie" u knihy "Kafka: Proměna"
        A kliknu na tlačítko "Půjčit" u knihy "Kafka: Proměna"
        Pak je kniha "Kafka: Proměna" označena jako vypůjčená 
        A datum výpůjčky knihy "Kafka: Proměna" je dnes

Tento scénář můžeme spustit na příkazové řádce příkazem:

    $ cucumber features/borrowing.feature

Interpret scénáře pak postupně vykonává všechny uvedené kroky (např. zajistí, že v databázi bude existovat příslušná čtenářka i kniha, mechanicky „klikne“ na tlačítko v aplikaci, apod.) a ověří, že nastane očekávaný výsledek: kniha je označena jako výpůjčená s dnešním datem. Výsledek úspěšně spuštěné testovací sekvence testů je vidět na obrázku níže:

![Colibriary Features Passing](/karmi/colibriary/raw/master/doc/text/colibriary-features-passing.png)

Jak jsme uvedli, _Cucumber_ však není pouhým _nástrojem_ pro mechanické spouštění akceptačních testů, ale rovněž _metodologií_. Z uvedeného zápisu vidíme, že struktura celého scénáře má několik důležitých aspektů:

1. „Požadavek“ (angl. _feature_), tedy název scénáře je velmi stručný a slouží ke konverzaci
2. Jeho popis v následující větě obsahuje tři klíčové součásti: _kdo_ dělá _co_ za jakým _účelem_. V angličtině: “As a [role] I want [feature] so that [benefit]“ (viz North, 2007)
3. Samotný scénář obsahuje popis kroků, které je třeba provést pro úspěšné splnění scénáře, a to ve formátu: _pokud_ existuje nějaký výchozí stav a _někdo_ provede určitou _akci_, _pak_ nastane nějaký stav, který musí odpovídat určitému předpokladu. V angličtině se tento formát označuje za „Given—When—Then“.

Formátem _kdo_ dělá _co_ za jakým _účelem_ se popis scénáře brání zavlečení nepotřebné funkcionality, protože vyžaduje specifikovat účel či hodnotu určité funkce pro uživatele.

Formát _pokud—když—pak_ nutí všechny zainteresované — analytiky, vývojáře i uživatele a zadavatele — v přirozeném jazyce, avšak _s velkou přesností_ specifikovat kroky nutné ke splnění scénáře.

Tento „jazyk“ (nazvaný _Gherkin_) definuje klíčová slova jako je _Pokud_ (_Given_) v mnoha přirozených jazycích, proto můžeme celý scénář psát v češtině.

Postup vývoje při použití scénáře pro _Cucumber_ je následující:

#### Sepsání požadavku ####

Nejprve ve spolupráci se zákazníkem sepíšeme požadavek a testovací scénář či scénáře. Viz [zdrojový kód](http://github.com/karmi/colibriary/commit/krok-1).

#### Spuštění scénáře ####

Spustíme scénář a uvidíme, že jsme nedefinovali předpoklady jednotlivých kroků. _Cucumber_ nám navrhne šablony toho, jak je definovat.

![Colibriary Features Failing](/karmi/colibriary/raw/master/doc/text/colibriary-features-failing.png)

#### Definice předpokladů ####

V našem případě selhává již první krok: _Pokud existuje čtenářka jménem "Marie" s platným průkazem_. Tento předpoklad musíme tedy pomocí programovacího jazyka (v našem případě Ruby) implementovat, tím, že vytvoříme požadovaný záznam v databázi (viz [zdrojový kód](http://github.com/karmi/colibriary/commit/krok-2)):

    Pokud /^existuje čtenář.. jménem "([^"]*)" s platným průkazem$/ do |name|
      Reader.create :name => name, :card_id => 123
    end

Samozřejmě musíme též vytvořit nutnou infrastrukturu v naší aplikaci (ukládání čtenářů, viz [zdrojový kód](http://github.com/karmi/colibriary/commit/krok-3)).

Při spuštění celého scénáře pak uvidíme, že první krok prošel — čtenářka jménem „Marie“ existuje -- a můžeme pokročit k dalším:

![Colibriary Features First Step](/karmi/colibriary/raw/master/doc/text/colibriary-features-first-step.png)

Postupně pokračujeme definicí předpokladů spuštění scénáře (kroky „Pokud“), až dojdeme ke krokům, které znamenají interakci s aplikací (kroky „Když“).

#### Definice interakce s aplikací ####

S aplikací můžeme pracovat pomocí jednoduchého jazyka: načítat jednotlivé stránky, vyplňovat hodnoty do formulářů a odesílat je, apod. Definice kroku _Když vyplním číslo průkazu čtenářky jménem "Marie" u knihy "Kafka: Proměna"_ vypadá takto (viz [zdrojový kód](http://github.com/karmi/colibriary/commit/krok-4)):

    Když /^vyplním číslo průkazu čtenářky jménem "([^"]*)" u knihy "([^"]*)"$/ do |reader_name, book_name|
      author, title = author_and_title_from_book_name(book_name)
      reader = Reader.find_by_name(reader_name)
      book   = Book.find_by_author_and_title(author.strip, title.strip)
      fill_in dom_id(book, :borrower_card_id_for), :with => reader.card_id     #borrower_card_id_for_book_1
    end

V databázi tedy vyhledáme čtenářku s jménem "Marie" a knihu od autora "Kafka" s názvem "Proměna" a pomocí deklarace `fill_in` vyplníme číslo čtenářského průkazu (`reader.card_id`) do políčka formuláře.

#### Implementace požadovaného stavu v aplikaci ####

Konečně musíme implementovat požadovaný stav v aplikaci: zajistit, že fungují URL, která využíváme, že na ně v aplikaci reaguje výkonný kód, a tak dále. Jakmile projdou všechny kroky scénáře, můžeme jej považovat za úspěšně implementovaný. Přehled změn pro celý postup je uveden v [přehledu relevantních revizí](http://github.com/karmi/colibriary/compare/2dd9b3d0bad91bba970b17f5278f8b96c0e27984...626360e41580ddddcda8d524bcc01aa9b923ffee).

## Rychlost a vývoj software ##

Vidíme, jak definice požadavku v _Cucumber_ scénáři provádí vývojáře jednotlivými kroky, takže v každém momentu ví, co musí implementovat, co v aplikaci z pohledu interakce uživatele „chybí“. Autoři _Cucumber_ tento způsob nazývají „vývoj zvnějšku dovnitř“ (angl. _outside-in development_). Radikalizují tím myšlenku iterativního vývoje; implementace požadavku nezačíná na abstraktní úrovni aplikace (struktury databáze, datového modelu, ...), ale na její nejsvrchnější vrstvě, s níž pracuje uživatel.

Takový postup samozřejmě není možný u všech typů projektů. Existují rozsáhlé projekty v oblasti vojenství či finančnictví, které vyžadují mnohem formalizovanější postupy. Agilní metodiky, které jsme si představili v tomto textu, však získávají čím dál více na popularitě mezi různými typy vývojových týmů i projektů. Otázka zní, čím je tato popularita dána.

Podle výsledků publikovaných organizací _Standish Group_ softwarové projekty v roce 2004 průměrně překročily o více než polovinu odhadovaný rozpočet. Může se to zdát drastické, ale jedná se o obrovské zlepšení oproti až _dvojnásobnému_ překračování rozpočtů v devadesátých letech (InfoQ, 2006). Standish Group doprovází svoji zprávu tímto grafem:

![Chaosreport Chart Cost Overrun](/karmi/colibriary/raw/master/doc/text/chaosreport-chart-cost-overrun.png)

Autoři zprávy v citovaném článku dávají tento pozitivní trend do souvislosti s příchodem internetu (InfoQ, 2006): ústupem od tradiční architektury aplikací a orientací na webové aplikace. Ty poskytují oproti tradičním desktopovým aplikacím mnoho výhod: možnost rychlejší aktualizace jejich zdrojového kódu, aktualizace „za běhu“ bez nutnosti stahovat opravné balíčky na klientské stanice, rychlejší a snazší implementaci uživatelského rozhraní v HTML, CSS a JavaScriptu, a další. Všimněme si, že většina popisovaných výhod se točí okolo jednoho konceptu: konceptu _rychlosti_.

Aldous Huxley o rychlosti poznamenal, že je „drogou“, že „rychlost ... poskytuje to pravé moderní potěšení“ (Huxley, 2000, s. 263). Zdá se, že v moderním softwarovém vývoji platí tento aforismus dvojnásob. Nejenom, že se neustále zvyšuje „rychlost“ počítačů — fakt známý jako Mooreův zákon —, zvyšují se i očekávání a požadavky uživatelů, přicházejí nové technologie, které slibují „rychlejší“ vývoj, implementaci složitých funkcí v „krátkém čase“, ...

Tep procesu softwarového vývoje se zrychluje. Moderní webové aplikace nasazují nové verze do provozu, aniž by si toho uživatelé povšimli, a činí tak i několikrát denně. Popularita technologií jako např. _Ruby On Rails_ či _jQuery_ je dána především tím, že slibují _rychlejší_ a _snadnější_ vývoj, že umožňují v krátkém čase implementovat složité funkce.

Tento vývoj začíná zejména v oblasti vývoje pro web stírat tradiční rozdíl mezi „prototypem“, který slouží ke zkusmé implementaci funkcionality a koncovým software. Vžil se pro něj termín „nekonečný prototyp“ (angl. _perpetual beta_) a v tomto „nekonečně nehotovém“ stavu jsou vyvíjeny ty nejvytíženější, komplexní součásti současného internetu, jako např. Google Mail (GMail). Ještě pět let po jeho spuštění, v roce 2009, produktový manažer Gmailu Todd Jackson nálepku „prototypu“ obhajoval těmito slovy (Jackson, 2009, zvýr. KM):

> (...) změnilo by se doopravdy něco, kdybychom se této nálepky vzdali? Stejně bychom nasazovali nové funkce do produkce 
> stejně rychle jako nyní, a _doufejme i rychleji_.

V tomto smyslu pak „fáze“ softwarového vývoje v jejich tradičním či naivním pojetí mizejí. Navzájem splývá a prolíná se nejen prototypování se „skutečným vývojem“, ale též vývoj s testováním, testování se specifikací a specifikace se získáváním požadavků. Takové pojetí softwarového vývoje může připomínat více uměleckou tvorbu než onu tradiční inženýrskou práci, „stavění mostů“. Je-li však hlavním cílem agilních metodik vytvářet software, který je skutečně užitečný, nikoliv takový, který „splňuje zadání“, platí možná pro práci programátora podobná paradoxní maxima, kterou Jan Balabán vyslovil o úkolu spisovatele: „být přesný, nelhat a nevymýšlet si“ (Balabán, 2005).

---

## Bibliografie ##

* Agile Manifesto, Authors: _Authors: The Agile Manifesto_. Citováno 7. 7. 2010. Online: <http://agilemanifesto.org/authors.html>

* Agile Manifesto, Principles: _Principles behind the Agile Manifesto_. Citováno 7. 7. 2010. Online: <http://agilemanifesto.org/principles.html>

* Balabán, 2005: _Jan Balabán: Kdo pije sám, ten pije s ďáblem_. In: Hospodářské noviny, 20. 5. 2005. Též online: <http://hn.ihned.cz/c1-16186040-jan-balaban-kdo-pije-sam-ten-pije-s-dablem>

* Beck, 2003: Beck, Kent, _Test-driven development: By Example_, 2003

* Brooks, 1995: _The Mythical Man-Month. Essays on Software Engineering_, s. 179-203. Původně in: Information Processing 1986, the Proceedings of the IFIP Tenth World Computing Conference, 1986, s. 1069-1076. Též online: <http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.95.6363&rep=rep1&type=pdf>

* Chelimsky, 2007: Chelimsky, David, _Story Runner in Plain English_. Citováno 14. 7. 2010. Online: <http://blog.davidchelimsky.net/2007/10/21/story-runner-in-plain-english/>

* Chelimsky et al., 2010: Chelimsky, David; Astels, Dave; Dennis, Zach; Hellesøy, Aslak; Helmkamp, Bryan; North, Dan, _The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends_, 2010. 

* Cohn, 2004: Cohn, Mike, _User Stories Applied for Agile Software Development_, 2004.

* Critical Path Method: _Critical path method_, _Wikipedia_, The Free Encyclopedia. Citováno 7. 7. 2010. Online: <http://en.wikipedia.org/wiki/Critical_path_method>

* FIT: _Fit: Framework for Integrated Tests_, Citováno 14. 7. 2010. Online: <http://fit.c2.com/>

* FitNesse: _Welcome to FitNesse_, Citováno 14. 7. 2010. Online: <http://fitnesse.org/>

* Huxley, 2000: _Wanted, A New Pleasure._ 1931. In: Complete Essays: 1930-1935, 2000.

* IEEE 830: _IEEE Recommended Practice for Software Requirements Specifications_, 1998

* InfoQ, 2006: _Standish: Why were Project Failures Up and Cost Overruns Down in 1998?_. Citováno 16. 7. 2010. Online: <http://www.infoq.com/articles/chaos-1998-failure-stats>

* Jackson, 2009:  Chartier, David, _Interview: Gmail's product manager on Labs, beta, the future_. Citováno 16. 7. 2010. Online: <http://arstechnica.com/web/news/2009/03/interview-gmails-product-manager-on-labs-beta-the-future.ars> 

* jQuery: _jQuery: The Write Less, Do More, JavaScript Library_. Citováno 16. 7. 2010. Online: <http://jquery.com/>

* Krzywda, 2008: Krzywda, Andrzej, _What do I gain from TDD or BDD?_, Citováno 14. 7. 2010, <http://andrzejonsoftware.blogspot.com/2008/01/what-do-i-gain-from-tdd-or-bdd.html>

* Moore's Law: _Moore's Law_, _Wikipedia_, The Free Encyclopedia. Citováno 18. 6. 2010. Online: <http://en.wikipedia.org/wiki/Moore's_law>

* North, 2007: North, Dan: _What's in a Story?_. Citováno 14. 7. 2007. Online: <http://blog.dannorth.net/whats-in-a-story/>

* Planning Poker: _Planning Poker for Estimating on Agile Projects_. Citováno 13. 7. 2010. Online: <http://www.mountaingoatsoftware.com/topics/planning-poker>

* Royce, 1970: Royce, Winston, _Managing the Development of Large Software Systems_, In: Proceedings of IEEE WESCON 26 (August 1970), s. 1-9. Dostupné online: <http://www.cs.umd.edu/class/spring2003/cmsc838p/Process/waterfall.pdf>

* Ruby On Rails: _Ruby On Rails_. Citováno 16. 7. 2010. Online: <http://rubyonrails.org/>

* RUP: _IBM Rational Unified Process_, _Wikipedia_, The Free Encyclopedia. Citováno 6. 7. 2010. Online: <http://en.wikipedia.org/wiki/IBM_Rational_Unified_Process>

* Scrum: _Scrum (development_, _Wikipedia_, The Free Encyclopedia. Citováno 13. 7. 2010. Online: <http://en.wikipedia.org/wiki/Scrum_(development)>

* Use Case: _Use case_, _Wikipedia_, The Free Encyclopedia. Citováno 13. 7. 2010. Online: <http://en.wikipedia.org/wiki/Use_case>

* Vlasák, 2003: Vlasák, Rudolf a Bulíčková, Soňa, _Základy projektování informačních systémů_, 2003.
