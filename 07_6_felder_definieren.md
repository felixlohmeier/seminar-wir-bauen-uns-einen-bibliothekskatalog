# 7.6 Felder definieren

Jetzt wird es konkret: Welche Informationen wollen Sie in Ihrem Bibliothekskatalog anbieten? Welche Kurzinformationen sollen in der Trefferliste stehen? Welche Informationen sollen in der Vollanzeige dargestellt werden? Im Suchindex wird alles in Feldern abgelegt, die später im Relevanzranking auch gewichtet werden können. In der Software zur Anzeige (TYPO3-find in unserem Fall), können Sie auch später noch mehrere Felder kombiniert darstellen.

## Aufgabe 1: Identifizieren Sie wichtige Felder wie Titel, Autor/in, Ort, Erscheinungsjahr, Medientyp in den MARC-Daten

Hinweise:

* Wenn Sie im [OPAC der HAW Hamburg](https://kataloge.uni-hamburg.de/LNG=DU/DB=2/) in die Suche ```PPN .?``` eingeben, dann erhalten Sie alle rund 450.000 Treffer. Über den Menüpunkt Trefferanalyse können Sie sich dann einen groben Überblick über die enthaltenen Daten verschaffen. Mit der Suche können Sie auch direkt einzelne Datensätze aufrufen. Beispiel: ```PPN 834422018```.
* Nutzen Sie die [Arbeitstabelle der Deutschen Nationalbibliothek](http://www.dnb.de/SharedDocs/Downloads/DE/DNB/standardisierung/marc21FeldbeschreibungTitelExcel032016.zip) in der [Dokumentation des MARC21-Formats](http://www.dnb.de/DE/Standardisierung/Formate/MARC21/marc21_node.html), um die MARC-Felder zu übersetzen.
* Der Suchindex erwartet eine eindeutige Kennung (Identifier) in der ersten Spalte. Prüfen Sie, ob Sie eine vorhandene Nummer dafür verwenden können.

## Lösung

Hier gibt es keine allgemeingültige Lösung. Jetzt ist es an Ihnen, Ihren Katalog so zu gestalten, wie Sie ihn haben wollen. Notieren Sie sich zunächst die MARC-Felder, die besonders relevant oder interessant für Sie sind.

## Aufgabe 2: Bilden Sie neue Felder (bzw. Spalten) durch die Kombination von verschiedenen Feldern

Hinweise:

* Wenn Sie nicht wissen, wo Sie beginnen sollen, dann versuchen Sie zunächst mit einem kleinen Satz von Feldern anzufangen. In Kapitel 4 haben Sie das Format Dublin Core als einen "kleinsten gemeinsamen Nenner" kennengelernt. Sie können damit beginnen diese Felder zu bilden. Die Library of Congress hat einen [Crosswalk von MARC21 zu Dublin Core](http://www.loc.gov/marc/marc2dc.html) bereitgestellt, den Sie zur Orientierung nutzen können.

<!---

## Lösung

Vorgehen für Felder, die im Crosswalk von MARC21 zu Dublin Core (unqualified) genannt sind:

...

**Als JSON-Datei: [07_6-2.json](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_6-2.json)**

--->

## Aufgabe 3: Daten bereinigen

Hinweise:

* Prüfen Sie, ob in den Feldern noch unerwünschte Zeichen vorkommen, die nicht im Suchindex landen sollen.
* Versuchen Sie außerdem Datumsangaben mit der Funktion ```toDate()``` in maschinenlesbare Datumsformate nach ISO-8601 zu wandeln.
* Der Suchindex erwartet eine eindeutige Identifikationsnummer in der ersten Spalte. Das Feld wird üblicherweise ```id``` benannt. Benennen Sie die Spalte mit dem MARC-Feld ```001``` in ```id``` um und verschieben Sie diese in die erste Spalte (falls Sie dort nicht ohnehin stehen sollte).

<!---

## Lösung (für die Felder aus Lösung Aufgabe 2)

...

** Als JSON-Datei (für die Felder aus Lösung Aufgabe 2): [07_6-3.json](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_6-3.json)****

--->

## Literatur

* Owen Stephens: [A worked example of fixing problem MARC data: Part 4 – OpenRefine](http://www.meanboyfriend.com/overdue_ideas/2015/07/worked-example-fixing-marc-data-4/)
* Library Carpentry OpenRefine: [Basic OpenRefine functions II](https://data-lessons.github.io/library-openrefine/04-basic-functions-II/)
