# 4.4 Download der Metadaten

## Aufgabe 1: 100 PPNs aus dem Katalog in einer Text-Datei notieren

Für die Abfrage über die unAPI-Schnittstelle benötigen wir die Identifikationsnummern (hier PPNs) derjenigen Datensätze, die wir abfragen wollen. Also brauchen wir eine Liste der PPNs, z.B. in einer einfachen Text-Datei.

## Lösung

Folgende Abfrage über die [SRU-Schnittstelle des GBV](https://www.gbv.de/wikis/cls/SRU) liefert die ersten 100 Treffer in einer XML-Datei im Format PICAXML für den Suchbegriff ```open```

{%s%}http://sru.gbv.de/opac-de-18-302?operation=searchRetrieve&query=pica.all%3Dopen&maximumRecords=100&startRecord=1&recordSchema=picaxml{%ends%}

Daraus können wir die PPNs im Feld 003@ mit grep und sed extrahieren:

{%s%}curl "http://sru.gbv.de/opac-de-18-302?operation=searchRetrieve&query=pica.all%3Dopen&maximumRecords=100&startRecord=1&recordSchema=picaxml" | grep --no-group-separator -A 1 "003@" | sed 's/^ *//; s/ *$//; s/<[^>]*>//g; /^$/d' > 100ppns.txt{%ends%}

## Aufgabe 2: Shell-Script zum Download der Metadaten schreiben

* Mit curl über die unAPI-Schnittstelle wie in Kapitel 4.2 geübt
* Format: PICAXML
* Bei zu schnell aufeinander folgenden Abfragen verweigert die Schnittstelle evtl. die Antwort, daher Wartezeit 1 Sekunde zwischen den Abfragen einbauen

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

## Aufgabe 2: Heruntergeladene XML-Dateien zusammenführen

XML bietet durch seine Baumstruktur die Möglichkeit mehrere Datensätze in einer Datei abzubilden. Die Inhalte der Einzeldateien einfach aneinanderzureihen funktioniert leider nicht, da jede Datei einen eigenen "Header" mitbringt und die XML-Syntax nur einen Header erlaubt. Die Zusammenführung gestaltet sich also etwas komplizierter. Dazu können entweder extra Tools verwendet werden, die für XML gebaut wurden oder Sie nutzen die typischen Kommandozeilenwerkzeuge in trickreicher Kombination.

**Literaturtipps:**
* https://en.wikipedia.org/wiki/Comparison_of_XML_editors
* http://www.ethanjoachimeldridge.info/tech-blog/combine-xml-files

## Lösung
...

## Alternative: SRU-Schnittstelle

Mit Suchabfragen der folgenden Form ließen sich auch alle Daten sukzessive abrufen:
1. http://sru.gbv.de/opac-de-18-302?operation=searchRetrieve&query=pica.ppn=.*&maximumRecords=100&startRecord=001&recordSchema=picaxml
2. http://sru.gbv.de/opac-de-18-302?operation=searchRetrieve&query=pica.ppn=.*&maximumRecords=100&startRecord=101&recordSchema=picaxml
3. http://sru.gbv.de/opac-de-18-302?operation=searchRetrieve&query=pica.ppn=.*&maximumRecords=100&startRecord=201&recordSchema=picaxml
4. ...

Die Suche nach ```pica.ppn=.*``` liefert alle Datensätze zurück, wird mit ```maximumRecords=100``` begrenzt (sonst liefert die Schnittstelle gar keine Daten) und sukzessive mit einem Parameter ```startRecord=``` abgefragt. Das ließe sich auch gut in einem Shell-Script abfragen.