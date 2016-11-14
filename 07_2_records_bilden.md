# 7.2 Records bilden

## Aufgabe: Editieren Sie die Daten so, dass OpenRefine die 100 Datensätze jeweils als "Records" erkennt.

Hinweise:

* OpenRefine erkennt Records (Datensätze) anhand der ersten Spalte. Versuchen Sie in alle 100 Zeilen, in denen ein Datensatz beginnt, eine eindeutige Kennung in die erste Spalte zu bekommen. Die übrigen Zellen in der ersten Spalte sollten leer sein.
* Wechseln Sie die Ansicht oben zwischen "Rows" und "Records" und prüfen Sie die Änderung der Darstellung.
* Den Wert einer anderen Spalte kopieren Sie über die Transformationsregel: ```cells["NAME-DER-SPALTE"].value```

Literatur:

* [Difference between a record and a row](http://kb.refinepro.com/2012/03/difference-between-record-and-row.html)
* [Create records in Google Refine](http://kb.refinepro.com/2012/06/create-records-in-google-refine.html)

## Lösung

Spalten ordnen

* {%s%}All / Edit columns / Re-order / remove columns...{%ends%}
* {%s%}Spalte "record - leader" ganz nach oben schieben{%ends%}

Angabe in Spalte record-leader durch PPN aus Spalte "record - controlfield" ersetzen

* {%s%}Spalte "record - controlfield - tag" / Facet / Text Facet / Wert 001 auswählen{%ends%}
* {%s%}Spalte "record - leader" / Edit cells / Transform... und folgenden Wert eingeben: cells["record - controlfield"].value{%ends%}

Leere Zeilen löschen

* {%s%}Spalte "record - datafield - subfield" / Facet / Customized facets / Facet by blank / Wert true anklicken (Achtung: im Modus "rows" und vorige Facette wieder schließen){%ends%}
* {%s%}All / Edit rows / Remove all matching rows{%ends%}

Records anklicken