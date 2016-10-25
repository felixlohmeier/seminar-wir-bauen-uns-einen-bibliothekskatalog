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

{%s%}curl "http://sru.gbv.de/opac-de-18-302?operation=searchRetrieve&query=pica.all%3Dopen&maximumRecords=100&recordSchema=marcxml" > open_001_100.marcxml{%ends%}

## Aufgabe 2: 1000 Records über die SRU-Schnittstelle laden

In Aufgabe 1 haben wir 100 Records über die SRU-Schnittstelle geladen. Wenn wir den Parameter maximumRecords einfach auf 1000 erhöhen, dann meldet die Schnittstelle einen Fehler zurück (probieren Sie es aus...). Wir müssen also mehrere Anfragen in 100er-Paketen stellen.

Hinweise:
* Nutzen Sie den zusätzlichen Parameter ```startRecord```

## Lösung

Download in 100er-Paketen:
* {%s%}curl "http://sru.gbv.de/opac-de-18-302?operation=searchRetrieve&query=pica.all%3Dopen&maximumRecords=100&startRecord=1&recordSchema=marcxml" > open_001_100.marcxml{%ends%}
* {%s%}curl "http://sru.gbv.de/opac-de-18-302?operation=searchRetrieve&query=pica.all%3Dopen&maximumRecords=100&startRecord=101&recordSchema=marcxml" > open_101_200.marcxml{%ends%}
* {%s%}curl "http://sru.gbv.de/opac-de-18-302?operation=searchRetrieve&query=pica.all%3Dopen&maximumRecords=100&startRecord=201&recordSchema=marcxml" > open_201_300.marcxml{%ends%}
* usw.

## Aufgabe 3: Shell-Script zum Download von 1000 Records schreiben 

* Mit **curl** wie in Kapitel 4.2 geübt
* Über die SRU-Schnittstelle (vgl. Lösung Aufgabe 1)

**Literaturtipps:**
* https://wiki.ubuntuusers.de/Shell/Bash-Skripting-Guide_f%C3%BCr_Anf%C3%A4nger/
* http://stackoverflow.com/questions/16131321/shell-script-using-curl-to-loop-through-urls

## Lösung

```
#!/bin/bash

url=http://unapi.gbv.de/?id=opac-de-18-302:ppn:
format=picaxml
mkdir download

while read ppn
do
    content=$(curl "{$url}${ppn}&format=${format}")
    echo $content >> download/$ppn.picaxml
    sleep 1
done < 100ppns.txt
```

* Diesen Textinhalt in einer Datei abspeichern, z.B. mit ```nano download.sh```
* Danach muss das Script noch ausführbar gemacht werden: ```chmod +x download.sh```
* Script starten mit ```./download.sh```

## Download der vollständigen Metadaten des HAW-Katalogs

...

http://sru.gbv.de/opac-de-18-302?operation=searchRetrieve&query=pica.ppn=.*&maximumRecords=100&startRecord=1&recordSchema=picaxml

Die Suche nach ```pica.ppn=.*``` liefert alle Datensätze zurück, wird mit ```maximumRecords=100``` begrenzt (sonst liefert die Schnittstelle gar keine Daten) und sukzessive aufsteigend mit ```startRecord=1```, ```startRecord=101```, ```startRecord=201``` usw. abgefragt.