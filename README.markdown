Colibriary
==========

ENGLISH INFO: Demo application to show Cucumber-based „outside-in development“ in Rails 3 using Czech localization. The commits represent various steps through the behaviour-driven development.

---

_Colibriary_ je ukázková Ruby On Rails 3 aplikace pro demonstraci
[„vývoje zvnějšku dovnitř“](http://mwrc2009.confreaks.com/14-mar-2009-15-00-bdd-with-cucumber-ben-mabey.html)
za pomoci metodologie a nástroje pro akceptační testy, [_Cucumber_](http://cukes.info/).

_Cucumber_ umožňuje psát akceptační testy pro webové aplikace v přirozeném jazyce, v našem případě česky,
a pak tyto testy spouštět pomocí simulace webového prohlížeče (v našem případě 
[_Capybara_](http://github.com/jnicklas/capybara)). Podporuje krokový, inkrementální vývoj a zaměření na
uživatelsky hodnotné aspekty funkcionality aplikace.

Aplikaci samotnou tvoří zárodek jednoduchého systému na evidenci výpůjček knih. Datový model i funkcionalita jsou radikálně omezeny, aby bylo možné demonstrovat samotný proces vývoje.

![Colibriary Screenshot](http://github.com/karmi/colibriary/raw/master/doc/colibriary_screenshot.png)

Aplikace implementuje následující požadavek či scénář (_user story_):

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


Instalace
---------

Aplikaci si naklonujte pomocí Gitu nebo stáhněte z Githubu <http://github.com/karmi/colibriary/zipball/master>.

Aplikace vyžaduje:

* Ruby 1.8.7,
* RubyGems 1.3.6 nebo vyšší,
* pre-release verze Ruby on Rails a několika ostatních gemů

Budete potřebovat nástroj [_Bundler_](http://gembundler.com/) pro jejich instalaci:

    $ sudo gem install bundler

Ujistěte se, že máte všechny potřebné gemy pro Ruby:

    $ bundle check

Pokud tomu tak není, nainstalujte je:

    $ bundle install

Poté spusťte skripty pro zřízení správné struktury databáze:

    $ rake db:migrate
    $ rake db:test:prepare

Nyní můžete aplikaci nastartovat:

    $ rails server thin

Měli byste ji najít běžící na adrese <http://localhost:3000/books>.


Testy a specifikace
-------------------

Testy aplikace ve formátu [_RSpec_](http://rspec.info/) spustíte příkazem:

    $ rspec --format documentation spec/

Akceptační testy aplikace ve formátu [_Cucumber_](http://cukes.info/) scénářů spustíte příkazem:

    $ rake cucumber:all


Postup
------

Celý postup si můžete prostudovat v [historii projektu](http://github.com/karmi/colibriary/commits/master).
Jednotlivé _commity_ odpovídají krokům vývoje.

_Cucumber_ prosazuje vývoj tzv. „zvnějšku dovnitř“, kdy nejprve definujeme obecné chování a rozhraní aplikace, a přes její vrstvy blíže k uživateli se propracováváme k modelům a _back-endu_ aplikace.

Logika aplikace je pokryta testy ve formátu _RSpec_, její webové rozhraní pomocí scénáře pro _Cucumber_.

---

(c) [Karel Minařík](http://karmi.cz), MIT License
