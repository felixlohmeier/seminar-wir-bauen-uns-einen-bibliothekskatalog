# 4.3 Übung: Vergleich der verschiedenen Formate

Im vorigen Abschnitt haben wir beispielhaft Katalogdaten in verschiedenen Formaten heruntergeladen. Jetzt stellt sich die Frage, mit welchem dieser Formate wir weiterarbeiten wollen. Wie eingangs beschrieben, suchen wir ein einfach zu verarbeitendes, gut strukturiertes Format, dass alle benötigten Daten beinhaltet. Um eine Entscheidung für eines der Formate treffen zu können, sollten wir die heruntergeladenen Metadaten mit dem OPAC abgleichen (Aufgabe 1) und die Formate untereinander vergleichen (Aufgabe 2).

## Aufgabe 1: Heruntergeladene Metadaten mit der Anzeige im OPAC abgleichen

Im [Katalog der HAW Hamburg](https://kataloge.uni-hamburg.de/LNG=DU/DB=2/) werden in der Detailansicht eine ganze Reihe von Metadaten zu den Bibliotheksbeständen angezeigt, die wir auch in unserem zukünftigen Katalog verwenden wollen. Suchen Sie einzelne Wörter aus dem Katalogeintrag in den heruntergeladenen Metadaten, um festzustellen, ob diese Wörter in den jeweiligen Formaten überhaupt enthalten sind.

Am einfachsten ist es, wenn Sie dazu Texte im OPAC markieren und in die Zwischenablage kopieren. In den meisten Browsern funktioniert dies über die Tastenkombination ```STRG+C```. Das Einfügen in Putty hingegen funktioniert anders als erwartet mit einem Rechtsklick.

Aus dem [Benutzerhandbuch von Putty](http://the.earth.li/~sgtatham/putty/0.52/htmldoc/Chapter3.html#3.1.1):
> "PuTTY's copy and paste works entirely with the mouse. In order to copy text to the clipboard, you just click the left mouse button in the terminal window, and drag to select text. When you let go of the button, the text is automatically copied to the clipboard."

## Lösung

PPN 834422018 direkt im OPAC aufrufen:
* {%s%}https://kataloge.uni-hamburg.de/DB=2/XMLPRS=N/PPN?PPN=834422018{%ends%}
* {%s%}Die Zahl am Ende der URL kann entsprechend angepasst werden.{%ends%}

Suche nach Wörtern in den heruntergeladenen Metadaten:
* {%s%}grep -i -n -H "Lehrbuch" 834422018*{%ends%}
* {%s%}Im Ordner mit den Dateien ausführen{%ends%}

## Aufgabe 2: Direkter Vergleich der Metadatenformate

Vergleichen Sie das interne Format des Bibliothekssystems (PICA+/PICAXML) mit den ebenfalls über die Schnittstellen des GBV angebotenen Formaten MARC21/MARCXML, DC und MODS. Die Umwandlung von PICA+ in PICAXML und MARC21 in MARCXML ist verlustfrei, so dass drei Vergleiche zu tätigen sind:
1. PICAXML vs. MARCXML
2. PICAXML vs. DC
3. PICAXML vs. MODS

Für den Vergleich können Sie Onlinetools wie [Diff Checker](https://www.diffchecker.com/) oder [Tools auf der Kommandozeile](http://www.tecmint.com/best-linux-file-diff-tools-comparison/) verwenden.

## Lösung

Vorverarbeitung:
* picaxml: {%s%}curl -s "http://unapi.gbv.de/?id=opac-de-18-302:ppn:834422018&format=picaxml" | sed 's/^ *//; s/ *$//; /^$/d; s/<[^>]*>//g' | sort | uniq > 834422018.picaxml.strip{%ends%}
* marcxml: {%s%}curl -s "http://unapi.gbv.de/?id=opac-de-18-302:ppn:834422018&format=marcxml" | sed 's/--/\n/g' | sed 's/^ *//; s/ *$//; /^$/d; s/<[^>]*>//g' | sort | uniq > 834422018.marcxml.strip{%ends%}
* dc: {%s%}curl -s "http://unapi.gbv.de/?id=opac-de-18-302:ppn:834422018&format=dc" | sed 's/^ *//; s/ *$//; /^$/d; s/<[^>]*>//g' | sort | uniq > 834422018.dc.strip{%ends%}
* mods: {%s%}curl -s "http://unapi.gbv.de/?id=opac-de-18-302:ppn:834422018&format=mods" | sed 's/^ *//; s/ *$//; /^$/d; s/<[^>]*>//g' | sort | uniq > 834422018.mods.strip{%ends%}

Vergleich picaxml mit marcmxl/dc/mods:
* picaxml vs. marcxml: {%s%}diff -u 834422018.picaxml.strip 834422018.marcxml.strip{%ends%}
* picaxml vs. dc: {%s%}diff -u 834422018.picaxml.strip 834422018.dc.strip{%ends%}
* picaxml vs. mods: {%s%}diff -u 834422018.picaxml.strip 834422018.mods.strip{%ends%}

Grafischer Vergleich picaxml mit marcxml/dc/mods:
* picaxml vs. marcxml: {%s%}vimdiff 834422018.picaxml.strip 834422018.marcxml.strip{%ends%}
* picaxml vs. dc: {%s%}vimdiff 834422018.picaxml.strip 834422018.dc.strip{%ends%}
* picaxml vs. mods: {%s%}vimdiff 834422018.picaxml.strip 834422018.mods.strip{%ends%}
* Tipp: {%s%}Beenden von vimdiff mit zweimal :q und enter{%ends%}

Erläuterungen zu einzelnen Schritten der Vorverarbeitung:
* keine Statusinfos ausgeben (silent): {%s%}curl -s{%ends%}
* Leerzeichen links entfernen: {%s%}sed 's/^ *//'{%ends%}
* Leerzeichen rechts entfernen: {%s%}sed 's/ *$//'{%ends%}
* Leere Zeilen entfernen: {%s%}sed '/^$/d'{%ends%}
* Trennzeichen -- durch Zeilenumbrüche ersetzen(marcxml): {%s%}sed 's/--/\n/g'{%ends%}
* Alle Zeilen alphanumerisch sortieren: {%s%}sort{%ends%}
* Doppelte Zeilen entfernen: {%s%}uniq{%ends%}