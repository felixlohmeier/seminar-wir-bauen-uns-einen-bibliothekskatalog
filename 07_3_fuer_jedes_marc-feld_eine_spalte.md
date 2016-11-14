# 7.3 Für jedes MARC-Feld eine Spalte

## Aufgabe: Transformieren Sie die Daten so, dass jeder Datensatz nur über eine Zeile geht

Aktuell sind die Inhalte eines Datensatzes über viele Zeilen verteilt. Die MARC-Felder stehen untereinander in Zeilen. Versuchen Sie, die Daten in eine übliche Tabellenstruktur zu bringen:

* Die MARC-Felder in den Spaltenüberschriften.
* Jeder Datensatz nur über eine Zeile.

Hinweise:

* Experimentieren Sie mit den Funktionen im Menü "Transpose".
* Vor dem Transpose sollten Sie die Daten in wenige Spalten zusammenführen. Nutzen Sie dazu die folgende Transformationsregel: ```value + " : " + cells["NAME-DER-SPALTE"].value```
* Für manche zeilenbasierte Operationen müssen Sie wieder auf den Modus "Rows" (statt "Records") wechseln.

Literatur:

* [How can I join two datasets using a key in OpenRefine, with the secondary table having more than one value?](http://www.devsplanet.com/question/35776263) und [Cells to columns in OpenRefine](http://stackoverflow.com/questions/15187543/cells-to-columns-in-openrefine)
* [Zellen zusammenführen](http://kb.refinepro.com/2011/07/merge-2-columns-that-have-both-blank.html)
* [Trick, um neue Zeilen einzufügen](http://kb.refinepro.com/2011/12/add-extra-rows-records-in-google-refine.html)

## Lösung

Alle Schritte aus [Übung 7.2](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/07_2_records_bilden.html)

Vorerst nicht benötigte Spalten löschen

* {%s%}All / Edit columns / Re-order / remove columns...{%ends%}
* {%s%}Spalten "record", "record - datafield", "record - datafield - ind1", "record - datafield - ind2" "record-controlfield" und "record-controlfield-tag" nach rechts schieben{%ends%}

MARC-Felder durchgängig belegen

* {%s%}Spalte "record - datafield - tag" / Edit cells / Fill down{%ends%}

PPN aus Spalte record-leader in Spalte mit MARC-Feldern verschieben (und dafür eine neue Zeile einfügen)

* {%s%}Spalte "record - leader" / Add Column based on this column...; Name für neue Spalte: NEU{%ends%}
* {%s%}Spalte "record - leader" / Transpose / Transpose cells across columns into Rows; In der zweiten Feldliste Spalte "NEU" ganz oben auswählen, rechts "One column" auswählen und Name "PPN" eingeben{%ends%}
* {%s%}Spalte "record - datafield - tag" / Facet / Customized facets / Facet by blank / Wert true auswählen und in Modus "rows" wechseln{%ends%}
* {%s%}Spalte "record - datafield - tag" / Edit cells / Transform... / Wert "001" (also mit Anführungszeichen) eingeben und Facette schließen{%ends%}
* {%s%}Spalte "record - datafield - tag" / Facet / Text facet / Wert 001 auswählen{%ends%}
* {%s%}Spalte "record - datafield - subfield" / Edit cells / Transform... / Wert cells["PPN"].value eingeben und Facette schließen{%ends%}

Sortieren und Aufräumen

* {%s%}Spalte "PPN" / Edit cells / Fill down{%ends%}
* {%s%}Spalte "PPN" / Sort...{%ends%}
* {%s%}Spalte "record - datafield - tag" / Sort...{%ends%}
* {%s%}Im neu verfügbaren Menü "Sort" den Menüpunkt "Reorder rows permanently" auswählen{%ends%}
* {%s%}Spalte "PPN" / Edit column / Remove this column{%ends%}

MARC-Feld mit Feld MARC-Code zusammenfassen

* {%s%}Spalte "record - datafield - tag" / Edit cells / Transform... den Wert value + " : " + cells["record - datafield - subfield - code"].value eingeben{%ends%}
* {%s%}Spalte "record - datafield - subfield - code" / Edit column / Remove this column{%ends%}

Transpose

* {%s%}Spalte "record - datafield - tag" / Transpose / Columnize by key/value columns...{%ends%}