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
