# 4.4 Download der Metadaten

Die Verbundzentrale des Bibliotheksverbunds GBV bietet derzeit keinen einfachen Weg an, um regelmäßig vollständige Abzüge der Daten einer Bibliothek zu bekommen. Wenn wir also die Metadaten des Katalogs der HAW Hamburg eigenständig laden wollen, müssen wir eine der angebotenen öffentlichen Schnittstellen benutzen.

## Wahl des Formats

Von den angebotenen [Formaten](https://www.gbv.de/wikis/cls/UnAPI#Formate) kommen für uns nur PICA+/PICAXML oder MARC21/MARCXML in Frage. In der vorigen Übung sollten Sie festgestellt haben, dass in den alternativen Formaten wie DC, MODS oder ISBD nicht alle Daten enthalten sind. **Wir verwenden MARC21/MARCXML**, weil der Standard wesentlich weiter verbreitet ist als PICA+/PICAXML und somit mehr Tools und Anleitungen dazu verfügbar sind.

## Wahl der Schnittstelle

Aus der [Dokumentation des GBV](https://www.gbv.de/wikis/cls/Schnittstellen):
> Folgende öffentliche, webbasierten Schnittstellen (APIs, Webservice ...) sind im GBV-Verbundwiki dokumentiert:
> * SRU und Z39.50 für Suche und Abruf kleiner Mengen von Datensätzen
> * unAPI für den Abruf einzelner Datensätze
> * SeeAlso für den Abruf von Links und Empfehlungen
> * DAIA für den Abruf von Verfügbarkeitsinformationen
> * PAIA für Zugriff auf Benutzerkonten

**Wir verwenden die [SRU-Schnittstelle](https://www.gbv.de/wikis/cls/SRU)**, die einen ähnlichen Funktionsumfang wie die Z39.50-Schnittstelle anbietet und etwas moderner ist. Über die SRU-Schnittstelle stehen nur XML-Formate zur Verfügung, so dass wir im Folgenden mit **MARCXML** arbeiten werden.

## Aufgabe 1: 100 Records über die SRU-Schnittstelle laden

Lesen Sie die [Dokumentation zur SRU-Schnittstelle im Wiki des GBV](https://www.gbv.de/wikis/cls/SRU) und stellen Sie auf Basis des dort aufgeführten Beispiels eine Abfrage mit folgenden Parametern zusammen:
* Katalog der HAW Hamburg
* Suche über alle Felder
* Suchbegriff: ```open```
* Format: ```marcxml```
* Anzahl Records: ```100```

## Lösung

Folgende Abfrage über die SRU-Schnittstelle des GBV liefert die ersten 100 Treffer im Format ```marcxml``` für den Suchbegriff ```open``` im Katalog der HAW Hamburg:

{%s%}http://sru.gbv.de/opac-de-18-302?operation=searchRetrieve&query=pica.all%3Dopen&maximumRecords=100&recordSchema=marcxml{%ends%}

Zum Speichern der Daten nutzen wir curl wie in Kapitel 4.2 geübt:

{%s%}curl "http://sru.gbv.de/opac-de-18-302?operation=searchRetrieve&query=pica.all%3Dopen&maximumRecords=100&recordSchema=marcxml" > 1_100.marcxml{%ends%}

## Aufgabe 2: 1.000 Records über die SRU-Schnittstelle laden

In Aufgabe 1 haben wir 100 Records über die SRU-Schnittstelle geladen. Wenn wir den Parameter maximumRecords einfach auf 1000 erhöhen, dann meldet die Schnittstelle einen Fehler zurück (probieren Sie es aus...). Wir müssen also mehrere Anfragen in 100er-Paketen stellen.

**Hinweise:**
* Nutzen Sie den zusätzlichen Parameter ```startRecord```

## Lösung

Download in 100er-Paketen:
* {%s%}curl "http://sru.gbv.de/opac-de-18-302?operation=searchRetrieve&query=pica.all%3Dopen&maximumRecords=100&recordSchema=marcxml&startRecord=1" > 1-100.marcxml{%ends%}
* {%s%}curl "http://sru.gbv.de/opac-de-18-302?operation=searchRetrieve&query=pica.all%3Dopen&maximumRecords=100&recordSchema=marcxml&startRecord=101" > 101-200.marcxml{%ends%}
* {%s%}curl "http://sru.gbv.de/opac-de-18-302?operation=searchRetrieve&query=pica.all%3Dopen&maximumRecords=100&recordSchema=marcxml&startRecord=201" > 201-300.marcxml{%ends%}
* usw.

## Aufgabe 3: Shell-Script zum Download von 1000 Records schreiben 

Shell-Scripte ermöglichen die Automatisierung von Befehlen auf der Kommandozeile. So müssen Sie nicht alle Befehle nacheinander selbst eintippen, sondern brauchen nur einmal das Script starten und der Computer arbeitet die Befehle selbstständig nacheinander ab. Es können auch Variablen und Schleifen definiert werden, so dass die Befehle dynamisch innerhalb der Laufzeit des Scripts angepasst werden können, was sehr weitreichende Möglichkeiten bietet. Shell-Scripte sind somit ein erster Einstieg in die Programmierung, woher übrigens auch das Schimpfwort "[Scriptkiddie](https://de.wikipedia.org/wiki/Scriptkiddie)" stammt ;-).

Wenn Sie noch keine Erfahrung mit Shell-Scripten haben und die Aufgabe selbst lösen wollen, dann arbeiten Sie zunächst den sehr empfehlenswerten [Bash-Skripting-Guide für Anfänger](https://wiki.ubuntuusers.de/Shell/Bash-Skripting-Guide_f%C3%BCr_Anf%C3%A4nger/) durch (wofür Sie sich 1-2 Stunden Zeit nehmen sollten). Alternativ probieren Sie einfach die untenstehende Lösung aus und schauen was passiert.

**Hinweise:**
* Suchen Sie in Foren nach fertigen Lösungen (und wenn Sie nicht fündig werden, schauen Sie z.B. [hier](http://stackoverflow.com/questions/16131321/shell-script-using-curl-to-loop-through-urls))
* Verwenden Sie die Lösung aus Aufgabe 2 als Grundlage und versuchen Sie die 10 Einzelschritte über eine Schleife abzubilden.
* Definieren Sie zu Beginn Variablen, das macht das Script aufgeräumter und erleichtert spätere Anpassungen.
* Das Script läuft nicht durch, obwohl die Befehle einzeln in der Kommandozeile funktionieren? Achten Sie auf das sogenannte [Quoting](http://wiki.bash-hackers.org/syntax/quoting), das sind [übliche Fehler](http://www.greenend.org.uk/rjk/tech/shellmistakes.html#missingquote).

## Lösung

```
#!/bin/bash

url="http://sru.gbv.de/opac-de-18-302?operation=searchRetrieve&query=pica.all%3Dopen&maximumRecords=100&recordSchema=marcxml&startRecord="
startRecord=1
counter=100

while [ "$counter" -le 1000 ] ; do
    curl "${url}${startRecord}" > ${startRecord}-${counter}.marcxml
    let counter=counter+100
    let startRecord=startRecord+100
done
exit

```

**Ausführen:**
* Diesen Textinhalt in einer Datei abspeichern, z.B. mit ```nano download.sh```
* Danach muss das Script noch ausführbar gemacht werden: ```chmod +x download.sh```
* Script starten mit ```./download.sh```

**Erläuterungen:**
* Anfangs werden die Variablen ```url```, ```startRecord``` und ```counter``` definiert, die später mit ```${url}``` usw. wieder abgerufen werden. Der Wert für die Variable ```url``` muss in Anführungszeichen gesetzt werden, weil sonst das &-Zeichen von der Shell missverstanden würde.
* Als Schleife wurde hier die Form ```while [ ] ; do``` (...) ```done``` gewählt. Die Testbedingung ```"$counter" -le 1000``` innerhalb der eckigen Klammern des ```while```-Kommandos bedeutet, dass die Schleife solange ausgeführt wird, bis die Variable ```counter``` den Wert 1000 erreicht.
* Der curl-Befehl lautet nach Auflösung der Variablen genauso wie aus den vorigen Aufgaben bekannt. Der Dateiname unter dem das jeweilige Ergebnis gespeichert werden soll, setzt sich aus den Variablen ```startRecord``` und ```counter``` zusammen.
* Bevor der curl-Befehl erneut ausgeführt wird, sorgen die beiden ```let```-Befehle dafür, dass ```startRecord``` und ```counter``` jeweils um 100 erhöht werden. Somit lädt der zweite Durchlauf der Schleife die Records 101 bis 200.

## Download der vollständigen Metadaten des HAW-Katalogs

...

http://sru.gbv.de/opac-de-18-302?operation=searchRetrieve&query=pica.ppn=.*&maximumRecords=100&startRecord=1&recordSchema=picaxml

Die Suche nach ```pica.ppn=.*``` liefert alle Datensätze zurück, wird mit ```maximumRecords=100``` begrenzt (sonst liefert die Schnittstelle gar keine Daten) und sukzessive aufsteigend mit ```startRecord=1```, ```startRecord=101```, ```startRecord=201``` usw. abgefragt.