# 7.7 Felder definieren

Jetzt wird es konkret: Welche Informationen wollen Sie in Ihrem Bibliothekskatalog anbieten? Welche Kurzinformationen sollen in der Trefferliste stehen? Welche Informationen sollen in der Vollanzeige dargestellt werden? Im Suchindex wird alles in Feldern abgelegt, die später im Relevanzranking auch gewichtet werden können. In der Software zur Anzeige (TYPO3-find in unserem Fall), können Sie auch später noch mehrere Felder kombiniert darstellen.

## Aufgabe 1: Identifizieren Sie wichtige Felder wie Titel, Autor/in, Ort, Erscheinungsjahr, Medientyp in den MARC-Daten

Hinweise:

* Wenn Sie im [OPAC der HAW Hamburg](https://kataloge.uni-hamburg.de/LNG=DU/DB=2/) in die Suche ```PPN .?``` eingeben, dann erhalten Sie alle rund 450.000 Treffer. Über den Menüpunkt Trefferanalyse können Sie sich dann einen groben Überblick über die enthaltenen Daten verschaffen. Mit der Suche können Sie auch direkt einzelne Datensätze aufrufen. Beispiel: ```PPN 834422018```.
* Nutzen Sie die [Arbeitstabelle der Deutschen Nationalbibliothek](http://www.dnb.de/SharedDocs/Downloads/DE/DNB/standardisierung/marc21FeldbeschreibungTitelExcel032016.zip) in der [Dokumentation des MARC21-Formats](http://www.dnb.de/DE/Standardisierung/Formate/MARC21/marc21_node.html), um die MARC-Felder zu übersetzen.
* Der Suchindex erwartet eine eindeutige Kennung (Identifier) in der ersten Spalte. Prüfen Sie, ob Sie eine vorhandene Nummer dafür verwenden können.

## Aufgabe 2: Bilden Sie neue Felder (bzw. Spalten) durch die Kombination von verschiedenen Feldern

...

## Aufgabe 3: Löschen Sie alle nicht benötigten Daten

Hinweise:

* Am schnellsten geht es über die Funktion zum Neusortieren der Spalten. Alternativ könnten Sie auch beim Export nur einzelne Spalten auswählen.