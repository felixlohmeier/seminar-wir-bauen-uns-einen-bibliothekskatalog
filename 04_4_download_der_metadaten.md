# 4.4 Download der Metadaten

## Aufgabe 1: Shell-Script zum Download der Metadaten schreiben

* Mit curl über die unAPI-Schnittstelle
* Format: PICAXML
* Nicht zuviele Abfragen auf einmal, daher Wartezeit 1 Sekunde einbauen
* Liste der PPNs schwierig zu generieren, wird bereitgestellt

**Literaturtipps:**
* https://wiki.ubuntuusers.de/Shell/Bash-Skripting-Guide_f%C3%BCr_Anf%C3%A4nger/
* http://stackoverflow.com/questions/16131321/shell-script-using-curl-to-loop-through-urls

## Lösung
...

## Aufgabe 2: Heruntergeladene XML-Dateien zusammenführen

XML bietet durch seine Baumstruktur die Möglichkeit mehrere Datensätze in einer Datei abzubilden. Die Inhalte der Einzeldateien einfach aneinanderzureihen funktioniert leider nicht, da jede Datei einen eigenen "Header" mitbringt und die XML-Syntax nur einen Header erlaubt. Die Zusammenführung gestaltet sich also etwas komplizierter. Dazu können entweder extra Tools verwendet werden, die für XML gebaut wurden oder Sie nutzen die typischen Kommandozeilenwerkzeuge in trickreicher Kombination.

**Literaturtipps:**
* https://en.wikipedia.org/wiki/Comparison_of_XML_editors
* http://www.ethanjoachimeldridge.info/tech-blog/combine-xml-files

## Lösung
...