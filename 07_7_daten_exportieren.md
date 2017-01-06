# 7.7 Daten exportieren

OpenRefine bietet viele Möglichkeiten die Daten in verschiedene Formate zu exportieren. Wie eingangs beschrieben, wollen wir das Format TSV nutzen, das sehr einfach ist und sich später gut in den Suchindex spielen lässt.

Hinweise:

* Der Klick auf den Menüpunkt "Export / Tab-separated value" startet sofort einen Download der Daten. Dabei werden jedoch alle Spalten exportiert. Nutzen Sie stattdessen "Export / Custom tabular exporter..." und wählen Sie nur die in Kapitel 7.6 generierten Felder aus.
* Benennen Sie die Datei in "haw-prozessiert.tsv" um und laden Sie sie auf den Webserver in den Ordner ~/tsv.
* Wenn Sie die Daten exportiert haben, können Sie folgende Befehle zur Überprüfung der Daten verwenden: ```wc -l``` und ```head -n1```.

## Lösung

## Variante A: "Custom Tabular exporter"

* {%s%}Projekt in OpenRefine laden und im Menü oben rechts Export / Custom tabular exporter... auswählen.{%ends%}
* {%s%}Dann Button "De-select All" klicken und nur die Felder auswählen, die in Kapitel 7.6 angelegt wurden: id, ISBN, ISSN, Sprache, LCC, DDC, Urheber, Medientyp, Ort, Verlag, Jahr, Datum, Beschreibung, Schlagwoerter, Beitragende, Reihe, Vorgaenger, Nachfolger, Link, Titel.{%ends%}
* {%s%}Anschließend im Reiter Download auf den Download-Button klicken.{%ends%}

## Variante B: "Spalten löschen und normaler Export"

* {%s%}Alle Spalten löschen außer diejenigen, die in Kapitel 7.6 angelegt wurden: id, ISBN, ISSN, Sprache, LCC, DDC, Urheber, Medientyp, Ort, Verlag, Jahr, Datum, Beschreibung, Schlagwoerter, Beitragende, Reihe, Vorgaenger, Nachfolger, Link, Titel{%ends%}
* {%s%}Export / Tab-separated value{%ends%}

** Als JSON-Datei: [07_7.json](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_7.json)**

## Upload und Prüfung der TSV-Datei

* Upload auf den Webserver: {%s%}vgl. Lösung in Kapitel 6.3, Aufgabe 1.{%ends%}
* Zählung der Zeilen der TSV-Dateien (sollte der Anzahl der Records plus 1 entsprechen): {%s%}wc -l ~/tsv/haw-prozessiert.tsv{%ends%}
* Erste Zeile der TSV-Dateien anzeigen (sollte die Spaltenüberschriften beinhalten): {%s%}head -n1 ~/tsv/haw-prozessiert.tsv{%ends%}

## Literatur

* [Exporter in der OpenRefine Dokumentation](https://github.com/OpenRefine/OpenRefine/wiki/Exporters)