# 7.3 Für jedes MARC-Feld eine Spalte

Aktuell sind die Inhalte eines Datensatzes über viele Zeilen verteilt. Die MARC-Felder stehen untereinander in Zeilen. Wir transformieren die Daten nun so, dass die Daten wie in einer üblichen Tabelle strukturiert sind, d.h.:

* Die MARC-Felder in den Spaltenüberschriften.
* Jeder Datensatz nur über eine Zeile.

Hinweise:

* Wir nutzen dazu die Funktion "Transpose / Columnize by key/value columns". In der Version 2.6rc2 von OpenRefine ist ein Bug in dieser Funktion, daher müssen wir die Version 2.6rc1 nutzen.
* Vor dem Transpose müssen die Daten in zwei Spalten zusammengeführt werden
* Für manche zeilenbasierte Operationen müssen Sie wieder auf den Modus "Rows" (statt "Records") wechseln.

## Vorgehen

Schritt 1: Alle Schritte aus [Übung 7.2](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/07_2_records_bilden.html)

Schritt 2: Vorerst nicht benötigte Spalten löschen

* All / Edit columns / Re-order / remove columns...
* Spalten "record", "record - datafield", "record - datafield - ind1", "record - datafield - ind2" "record-controlfield" und "record-controlfield-tag" nach rechts schieben

Schritt 3: MARC-Felder durchgängig belegen

* Spalte "record - datafield - tag" / Edit cells / Fill down

Schritt 4: PPN aus Spalte record-leader in Spalte mit MARC-Feldern verschieben (und dafür eine neue Zeile einfügen)

* Spalte "record - leader" / Add Column based on this column...; Name für neue Spalte: NEU
* Spalte "record - leader" / Transpose / Transpose cells across columns into Rows; In der zweiten Feldliste Spalte "NEU" ganz oben auswählen, rechts "One column" auswählen und Name "PPN" eingeben
* Spalte "record - datafield - tag" / Facet / Customized facets / Facet by blank / Wert true auswählen und in Modus "rows" wechseln
* Spalte "record - datafield - tag" / Edit cells / Transform... / Wert "001" (also mit Anführungszeichen) eingeben und Facette schließen
* Spalte "record - datafield - tag" / Facet / Text facet / Wert 001 auswählen
* Spalte "record - datafield - subfield" / Edit cells / Transform... / Wert cells["PPN"].value eingeben und Facette schließen

Schritt 5: MARC-Feld mit Feld MARC-Code zusammenfassen

* Spalte "record - datafield - tag" / Edit cells / Transform... den Wert value + " : " + cells["record - datafield - subfield - code"].value eingeben
* Spalte "record - datafield - subfield - code" / Edit column / Remove this column

Schritt 6: Sortieren und Aufräumen

* Spalte "PPN" / Edit cells / Fill down
* Spalte "PPN" / Sort...
* Spalte "record - datafield - tag" / Sort...
* Im neu verfügbaren Menü "Sort" den Menüpunkt "Reorder rows permanently" auswählen
* Spalte "PPN" / Edit column / Remove this column

Schritt 7: Felder mit Mehrfachbelegungen zusammenführen

* Spalte "record - datafield - tag" / Edit cells / Blank down
* Spalte "record - datafield - subfield" / Join multi-valued cells und als Trennzeichen ␟ angeben (das Trennzeichen [Unit Separator ␟](http://unicode-table.com/en/241F/) aus dem Unicode-Zeichensatz kommt mit Sicherheit nicht in den Daten vor, daher ist dieses gut geeignet. Das Zeichen ist am einfachsten per copy & paste einzufügen).

Schritt 8: Transpose

* Spalte "record - datafield - tag" / Transpose / Columnize by key/value columns...

## Literatur

* [How can I join two datasets using a key in OpenRefine, with the secondary table having more than one value?](http://www.devsplanet.com/question/35776263) und [Cells to columns in OpenRefine](http://stackoverflow.com/questions/15187543/cells-to-columns-in-openrefine)
* [Zellen zusammenführen](http://kb.refinepro.com/2011/07/merge-2-columns-that-have-both-blank.html)
* [Trick, um neue Zeilen einzufügen](http://kb.refinepro.com/2011/12/add-extra-rows-records-in-google-refine.html)
