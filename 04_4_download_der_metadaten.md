# 4.4 Download der Metadaten

## Aufgabe 1: Shell-Script zum Download der Metadaten schreiben

* Mit curl über die unAPI-Schnittstelle wie in Kapitel 4.2
* Format: PICAXML
* Bei zu schnell aufeinander folgenden Abfragen verweigert die Schnittstelle evtl. die Antwort, daher Wartezeit 1 Sekunde zwischen den Abfragen einbauen
* Eine Liste der PPNs ist schwierig zu generieren, hier eine Datei mit 100 Stück: [100ppns.txt](data/100ppns.txt)

**Literaturtipps:**
* https://wiki.ubuntuusers.de/Shell/Bash-Skripting-Guide_f%C3%BCr_Anf%C3%A4nger/
* http://stackoverflow.com/questions/16131321/shell-script-using-curl-to-loop-through-urls

## Lösung

```
#!/bin/bash
url=curl "http://unapi.gbv.de/?id=opac-de-18-302:ppn:"
format=picaxml
while read ppn
do
    content=$(curl "{$url}${ppn}&format=${format}")
    echo $ppn
    echo $content >> $ppn.picaxml
    sleep 1
done < 100ppns.txt
```

* Diesen Textinhalt in einer Datei abspeichern, z.B. mit ```nano download.sh```
* Danach muss das Script noch ausführbar gemacht werden: chmod +x download.sh
* Im gleichen Ordner muss die Datei 100ppns.txt liegen, Download z.B. mit ```curl ```
* Script starten mit ./download.sh

## Aufgabe 2: Heruntergeladene XML-Dateien zusammenführen

XML bietet durch seine Baumstruktur die Möglichkeit mehrere Datensätze in einer Datei abzubilden. Die Inhalte der Einzeldateien einfach aneinanderzureihen funktioniert leider nicht, da jede Datei einen eigenen "Header" mitbringt und die XML-Syntax nur einen Header erlaubt. Die Zusammenführung gestaltet sich also etwas komplizierter. Dazu können entweder extra Tools verwendet werden, die für XML gebaut wurden oder Sie nutzen die typischen Kommandozeilenwerkzeuge in trickreicher Kombination.

**Literaturtipps:**
* https://en.wikipedia.org/wiki/Comparison_of_XML_editors
* http://www.ethanjoachimeldridge.info/tech-blog/combine-xml-files

## Lösung
...