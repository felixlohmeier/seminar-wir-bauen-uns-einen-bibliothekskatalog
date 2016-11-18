# 7.1 Facetten und Text Filter

Alle folgenden Übungen in den Kapiteln 7.1 bis 7.3 führen wir zunächst mit einer einzigen Datei aus dem Download durch. Diese Datei beinhaltet "nur" 100 Datensätze, mit denen wir beispielhaft arbeiten. In Kapitel 7.4 und 7.5 werden wir dann die gelernten Transformationen auf alle 450.000 Datensätze anwenden.

OpenRefine "versteht" das MARC-Format nicht. Es interpretiert die Daten daher genauso wie jede andere XML-Datei. Wenn Sie die Daten erstmalig in OpenRefine öffnen, sehen Sie daher die üblichen Nummern und Codes für die jeweiligen MARC-Felder in der Baumstruktur der XML-Datei. Die Bedeutung der MARC-Nummern und Codes müssen Sie nachschlagen. Der GBV bietet meines Wissens nach keine Beschreibung der Feldbelegungen an. Zur Orientierung können Sie die [Arbeitstabelle der Deutschen Nationalbibliothek](http://www.dnb.de/SharedDocs/Downloads/DE/DNB/standardisierung/marc21FeldbeschreibungTitelExcel032016.zip) in der [Dokumentation des MARC21-Formats](http://www.dnb.de/DE/Standardisierung/Formate/MARC21/marc21_node.html) verwenden.

## Aufgabe 1: Verschaffen Sie sich einen Überblick über die Daten(struktur) mit Hilfe von Facetten und Text Filtern

Hinweise:

* Starten Sie OpenRefine und laden Sie das in [Kapitel 6.3](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/06_3_openrefine_starten_und_daten_laden.html) angelegte Projekt.
* Schauen Sie sich die Einführungsvideos zu OpenRefine an, insbesondere die ca. [7-Minuten-Kurzeinführung bei YouTube](https://www.youtube.com/watch?v=B70J_H_zAWM)
* Konsultieren Sie die [Seite zur Facettierung in der Dokumentation von OpenRefine](https://github.com/OpenRefine/OpenRefine/wiki/Faceting) und probieren Sie verschiedene Facetten aus.
* Gute Übungen zum Einstieg bietet auch Library Carpentry OpenRefine: [Basic OpenRefine Functions I: Working with columns, sorting, faceting, filtering and clustering](https://data-lessons.github.io/library-openrefine/03-basic-functions-I/)

## Bonusaufgabe: Laden Sie die Arbeitstabelle der DNB in OpenRefine

Die Dokumentation der DNB steht auch als Tabellendokument zur Verfügung. Da OpenRefine auf die Bearbeitung von tabellarischen Daten ausgelegt ist, können Sie die Arbeitstabelle anstatt in Excel/LibreOffice auch gleich in OpenRefine als neues Projekt anlegen.

[Arbeitstabelle der Deutschen Nationalbibliothek](http://www.dnb.de/SharedDocs/Downloads/DE/DNB/standardisierung/marc21FeldbeschreibungTitelExcel032016.zip)
