# 7.6 Felder definieren

Jetzt wird es konkret: Welche Informationen wollen Sie in Ihrem Bibliothekskatalog anbieten? Welche Kurzinformationen sollen in der Trefferliste stehen? Welche Informationen sollen in der Vollanzeige dargestellt werden? Wir bilden jetzt aus den Rohdaten die gewünschten Felder.

Für alle folgenden Arbeiten in OpenRefine können Sie die Version 2.6rc2 verwenden:

```
sudo docker run --rm -p 8888:3333 -v /home/stud/refine:/data felixlohmeier/openrefine:2.6rc2 -i 0.0.0.0 -m 3G -d /data
```

## Literatur

* Owen Stephens: [A worked example of fixing problem MARC data: Part 4 – OpenRefine](http://www.meanboyfriend.com/overdue_ideas/2015/07/worked-example-fixing-marc-data-4/)
* Library Carpentry OpenRefine: [Basic OpenRefine functions II](https://data-lessons.github.io/library-openrefine/04-basic-functions-II/)


## Aufgabe 1: Prüfen, wie häufig Felder belegt sind

Sie können sich mit den Facetten in OpenRefine einen Überblick über die Belegung der Spalten verschaffen. Wählen Sie dazu ```Facet -> Customized facets -> Facet by blank```.

Da dies bei den vielen enthaltenen Spalten recht mühsam ist, können Sie alternativ die TSV-Dateien auch auf der Kommandozeile durchzählen.

### Vorgehen

**1. Projekt als TSV exportieren**

Das im vorigen Kapitel erstellte Gesamtprojekt wie gewohnt als TSV exportieren (vgl. [Kapitel 7.5](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/07_5_alle_daten_in_ein_projekt_laden.html), Aufgabe 4).

**2. TSV-Datei auf Server hochladen**

Die exportierte TSV-Datei in das Verzeichnis ```tsv``` auf den Webserver laden (vgl. [Kapitel 7.5](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/07_5_alle_daten_in_ein_projekt_laden.html), Aufgabe 5).

**3. Script ausführen**

* Script mit ```curl``` auf den Server laden: ```curl -O https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/scripte/count-tsv.sh```
* Script ausführbar machen: ```chmod +x count-tsv.sh```
* Script starten mit ```./count-tsv.sh ~/tsv/haw-komplett.tsv | tee felder.tsv```

### Ergebnis

Das Script gibt Ihnen nach und nach die Belegung aller enthaltenen Felder aus. Sie werden feststellen, dass viele Felder kaum belegt sind. Die dritte Spalte gibt an, wie häufig das Feld mehrfachbelegt ist (d.h. wie häufig das Zeichen ```␟``` vorkommt, das wir in Kapitel 7.3, Schritt 7 als Trennzeichen für mehrfach belegte Felder festgelegt haben).

Der letzte Teil des Befehls (```tee felder.tsv```) sorgt dafür, dass zusätzlich zu der Ausgabe auf der Kommandozeile die Ergebnisse in der Datei "felder.tsv" gespeichert wurden.


## Aufgabe 2: Datei felder.tsv in Tabellenverarbeitung (Excel/LibreCalc) öffnen

Laden Sie die Datei felder.tsv auf ihren Rechner und öffnen Sie diese in einem Tabellenverarbeitungsprogramm (Microsoft Excel oder LibreOffice Calc). Falls beim Öffnen ein Dialog erscheint, geben Sie an, dass die Zellen mit "Tab" getrennt sind.

Sortieren Sie die Tabelle nach Spalte "Vorkommen" aufsteigend. Bei über 440.000 Datensätzen können wir vermutlich diejenigen Felder vernachlässigen, die weniger als 10x belegt sind. Löschen Sie diese Spalten in OpenRefine.

## Lösung

* Datei felder.tsv herunterladen (vgl. [Kapitel 6.3](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/06_3_openrefine_starten_und_daten_laden.html), Aufgabe 1)
* Löschen der Spalten mit weniger als 10 Vorkommen in OpenRefine: Menü oben links "Undo / Redo" aufrufen und Button "Apply..." drücken. Den Inhalt aus der Datei [07_6-2.json](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_6-2.json) in die Zwischenablage kopieren und in das Textfeld von "Apply" einfügen und Button "Perform Operations" drücken.


## Aufgabe 3: Identifizieren Sie wichtige Felder wie Titel, Urheber, Ort, Erscheinungsjahr, Medientyp in den MARC-Daten

Notieren Sie Ihre Erkenntnisse zunächst in der Tabelle felder.tsv.

Hinweise:

* Wenn Sie im [OPAC der HAW Hamburg](https://kataloge.uni-hamburg.de/LNG=DU/DB=2/) in die Suche ```PPN .?``` eingeben, dann erhalten Sie alle rund 450.000 Treffer. Über den Menüpunkt Trefferanalyse können Sie sich dann einen groben Überblick über die enthaltenen Daten verschaffen. Mit der Suche können Sie auch direkt einzelne Datensätze aufrufen. Beispiel: ```PPN 834422018```.
* Wenn Sie nicht wissen, wo Sie beginnen sollen, dann versuchen Sie zunächst mit einem kleinen Satz von Feldern anzufangen. In Kapitel 4 haben Sie das Format Dublin Core als einen "kleinsten gemeinsamen Nenner" kennengelernt. Sie können damit beginnen, diese Felder zu bilden. Die Library of Congress hat einen [Crosswalk von MARC21 zu Dublin Core](http://www.loc.gov/marc/marc2dc.html) bereitgestellt, den Sie zur Orientierung nutzen können.
* Nutzen Sie zusätzlich die [Arbeitstabelle der Deutschen Nationalbibliothek](http://www.dnb.de/SharedDocs/Downloads/DE/DNB/standardisierung/marc21FeldbeschreibungTitelExcel032016.zip) in der [Dokumentation des MARC21-Formats](http://www.dnb.de/DE/Standardisierung/Formate/MARC21/marc21_node.html), um die MARC-Felder zu übersetzen.
* Der Suchindex erwartet eine eindeutige Kennung (Identifier) in der ersten Spalte. Prüfen Sie, ob Sie eine vorhandene Nummer dafür verwenden können.

## Lösung

* Hier gibt es keine allgemeingültige perfekte Lösung. Vergleichen Sie Ihre Erkenntnisse mit der folgenden unvollständigen Empfehlung: [felder.tsv](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/felder.tsv)**
* Diese unvollständige Empfehlung bildet auch die Grundlage für die folgenden Aufgaben. Diese haben nicht zum Ziel ein perfektes Mapping zu erstellen, sondern sollen ein paar Problemfelder illustrieren und sinnvolle Beispieldaten für den Suchindex (Kapitel 8) und die Kataloganzeige (Kapitel 9) bilden.


## Aufgabe 4: Bilden Sie in OpenRefine das Feld "Titel" durch die Kombination verschiedener MARC-Felder

Hinweise:

* Die Expression zur Kombination von mehreren Feldern lautet (am Beispiel der Spalten 245 : a und 245 : b): ```cells["245 : a"].value + cells["245 : b"].value```. Die Werte der Zellen werden also schlicht mit einem ```+``` verbunden.
* Leider schlägt diese Expression fehl, wenn die zu ergänzende Zelle leer ist. Daher muss eine if-Abfrage ergänzt werden, damit die Transformation nur für nicht-leere Zellen durchgeführt wird: ```cells["245 : a"].value + if(isNonBlank(cells["245 : b"].value,cells["245 : b"].value,"")```
* Üblicherweise werden die Bestandteile des Titels durch unterschiedliche Trennzeichen getrennt. Die Trennzeichen sollten allerdings nur ergänzt werden, wenn danach auch ein Wert folgt. Daher muss die Ergänzung des Trennzeichens mit einer if-Abfrage von der folgenden Zelle abhängig gemacht werden. Beispiel für 245 : a und 245 : b mit Trennzeichen: ```cells["245 : a"].value + if(isNonBlank(cells["245 : b"].value),". ","") + if(isNonBlank(cells["245 : b"].value),cells["245 : b"].value,"")
* Probieren Sie auf diese Weise alle relevanten MARC-Felder zu einem Titel-Feld zu kombinieren.

## Lösung

* {%s%}Spalte "245 : a" / Edit column / Add column based on this column...{%ends%}
* {%s%}New column name: Titel{%ends%}
* {%s%}Expression: value + if(isNonBlank(cells["245 : b"].value),". ","") + if(isNonBlank(cells["245 : b"].value),cells["245 : b"].value,"") + if(isNonBlank(cells["245 : n"].value)," - ","") + if(isNonBlank(cells["245 : n"].value),cells["245 : n"].value,"") + if(isNonBlank(cells["245 : p"].value)," - ","") + if(isNonBlank(cells["245 : p"].value),cells["245 : p"].value,"") + if(isNonBlank(cells["246 : a"].value)," - ","") + if(isNonBlank(cells["246 : a"].value),cells["246 : a"].value,""){%ends%}

**Als JSON-Datei: [07_6-4.json](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_6-4.json)**


## Aufgabe 5: Löschen Sie alle Datensätze, in denen das Feld "Titel" nicht belegt ist

Hinweise:

* In den ca. 440.000 Datensätzen sind viele Fremd- und Normdaten enthalten, die wir zunächst nicht berücksichtigen wollen, um es nicht zu kompliziert zu machen.
* Vereinfachend lässt sich annehmen, dass alle Datensätze, die nach Erledigung der Aufgabe 4 noch keinen Titel haben, gelöscht werden können.

## Lösung

* {%s%}Spalte "Titel" / Facet / Customized facets / Facet by blank / true{%ends%}
* {%s%}All / Edit rows / Remove all matching rows{%ends%}
* {%s%}Facette schließen{%ends%}

** Als JSON-Datei: [07_6-5.json](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_6-5.json)**


## Aufgabe 6: Generieren Sie einheitliche ISBN-Nummern mit 13 Ziffern

Hinweise:

* Im MARC-Feld "020 : a" stehen teilweise 10-stellige, teilweise 13-stellige ISBN-Nummern.
* Suchen Sie nach einem Weg, um diese auf 13 Ziffern zu vereinheitlichen.
* Da es hier viele Mehrfachbelegungen gibt, müssen Sie die Zellen zunächst aufsplitten und nach erledigter Transformation wieder zusammenführen. Dieser Prozess ist speicherintensiv, also starten Sie OpenRefine vor und nach dieser Aufgabe besser neu.

## Lösung

* {%s%}Spalte "020 : a" / Edit cells / Split multi-valued cells... / ␟{%ends%}
* {%s%}Spalte "020 : a" / Facet / Custom text facet... / Expression: value.length() / 13{%ends%}
* {%s%}Spalte "020 : a" / Edit column / Add column based on this column... / New column name: ISBN /Expression: value{%ends%}
* {%s%}Spalte "020 : a" / Facet / Custom text facet... / Expression: value.length() / 10{%ends%}
* {%s%}Spalte "ISBN" / Edit cells / Transform... / Expression: with('978'+cells["020 : a"].value[0,9],v,v+((10-(sum(forRange(0,12,1,i,toNumber(v[i])*(1+(i%2*2)) )) %10)) %10).toString()[0] ){%ends%}
* {%s%}Facette schließen{%ends%}
* {%s%}Spalte "ISBN" / Edit cells / Join multi-valued cells... / ␟{%ends%}
* {%s%}Spalte "020 : a" / Edit cells / Join multi-valued cells... / ␟{%ends%}

Anmerkung: Alle Sonderfälle, in denen noch Text hinter den ISBN-Nummern steht, sind mit diesen Transformationsregeln noch nicht behandelt. Dafür liegt aber zumindest für einen Teil der Datensätze eine einheitliche ISBN13-Kodierung vor.

** Als JSON-Datei: [07_6-6.json](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_6-6.json)**


## Aufgabe 7: Ergänzen Sie ein Feld "id" für den Suchindex

Der Suchindex Solr erwartet ein Feld "id" mit eindeutiger Kennung in der ersten Spalte.

## Lösung

* {%s%}Spalte "001" /  Edit column / Add column based on this column... / New column name: id{%ends%}

** Als JSON-Datei: [07_6-7.json](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_6-7.json)**


## Aufgabe 8: Wenden Sie die vorbereitete Transformationsdatei zur Generierung weiterer Felder an

Hinweise:

* Verwenden Sie die **JSON-Datei [07_6-8.json](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_6-8.json)**, die Transformationsregeln zur Generierung weiterer Felder auf Basis der Empfehlung aus Aufgabe 3 enthält.

## Lösung

* {%s%}Menü oben links "Undo / Redo" aufrufen und Button "Apply..." drücken {%ends%}
* {%s%}Den Inhalt aus der Datei 07_6-8.json (siehe Link oben) in die Zwischenablage kopieren und in das Textfeld von "Apply" einfügen und Button "Perform Operations" drücken{%ends%}