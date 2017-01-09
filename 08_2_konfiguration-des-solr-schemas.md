# 8.2 Konfiguration des Solr Schemas

Ab Solr Version 6.0 ist das sogenannte "managed schema" (auch "schemaless mode" genannt) voreingestellt. Solr analysiert bei der Indexierung die Daten und versucht das Schema selbst zu generieren. Felder können aber weiterhin zusätzlich manuell definiert werden.

Literatur:

* https://support.lucidworks.com/hc/en-us/articles/221618187-What-is-Managed-Schema-
* http://www.solrtutorial.com/schema-xml.html

## Aufgabe 1: Schema für Beispieldaten konfigurieren

Legen Sie zwei Felder "Title" und "Contributor" an.

Hinweise:

* Admin-Oberfläche aufrufen. Im Menü "Core Selector" den Index "gettingstarted" auswählen. Dann im zweiten Menü "Schema" aufrufen.

## Lösung

* Administrationsoberfläche: {%s%}http://192.168.1.1:8983/solr/#/gettingstarted/schema{%ends%}
* Feld Title ergänzen: {%s%}Button "Add Field" drücken, Title in das Feld name eingeben und als field type zum Beispiel "string" auswählen{%ends%}
* Feld Contributor ergänzen: {%s%}Button "Add Field", Contributor in das Feld name eingeben und als field type zum Beispiel "string" auswählen{%ends%}


## Aufgabe 2: Beispieldaten über Admin-Oberfläche laden

Laden Sie folgende CSV-Beispieldaten über die Admin-Oberfläche in Solr:

```
id,Contributor,Title
1,Klaus Gantert,Bibliothekswissen
2,Prof. Christine Gläser und Ursula Schulz, Bibliotheken als Schmelztiegel der Kulturen – ein Bericht aus der Werkstatt ethnographischer Methoden der Kundenforschung.
```

Hinweise:

* Admin-Oberfläche aufrufen. Im Menü "Core Selector" den Index "gettingstarted" auswählen. Dann im zweiten Menü "Documents" aufrufen.
* Prüfen Sie abschließend, ob die Daten indexiert sind: Entweder über eine Query in der Administrationsoberfläche oder über die Browse-Oberfläche

## Lösung

* Administrationsoberfläche: {%s%}http://192.168.1.1:8983/solr/#/gettingstarted/documents{%ends%}
* Daten laden: {%s%}Als Document type "CSV" auswählen und den Text oben in das Textfeld einfügen{%ends%}
* Prüfung: {%s%}In der Browsing-Oberfläche http://192.168.1.1:8983/solr/gettingstarted/browse/ nach gantert suchen{%ends%}


## Aufgabe 3: Schema über Admin-Oberfläche konfigurieren

Hinweise:

* Prüfen Sie mit dem Script ```count-tsv.sh``` aus Kapitel 7.6, Aufgabe 1 die Mehrfachbelegung der prozessierten Daten. Wenn in der Spalte Mehrfachbelegung ein Wert höher als 0 steht, dann sollte das Feld als "multiValued" markiert werden.
* Legen Sie für alle Spalten in den TSV-Daten ein Feld im Schema an.
* Admin-Oberfläche aufrufen. Im Menü "Core Selector" den Index "gettingstarted" auswählen. Dann im zweiten Menü "Schema" aufrufen.
* Im folgenden Kapitel 8.3 werden wir die Daten in Solr indexieren. Dabei erkennt Solr die allermeisten Felder automatisch. Wenn Sie sich Arbeit ersparen wollen, dann definieren Sie nur die Felder ```ISBN``` und ```DDC``` manuell. Alle anderen Felder sollte Solr automatisch erkennen. Wenn Sie lieber auf Nummer sicher gehen wollen, dann legen Sie alle Felder manuell an.
* Groß- und Kleinschreibung ist wichtig.

## Lösung

* Mehrfachbelegung prüfen: {%s%}./count-tsv.sh ~/tsv/haw-prozessiert.tsv{%ends%}
* Administrationsoberfläche: {%s%}http://192.168.1.1:8983/solr/#/gettingstarted/schema{%ends%}
* Feld ISBN ergänzen: {%s%}Button "Add Field" drücken, ISBN in das Feld name eingeben, als field type "string" auswählen und als multiValued markieren{%ends%}
* Feld ISSN ergänzen: {%s%}Button "Add Field" drücken, ISSN in das Feld name eingeben, als field type "string" auswählen und als multiValued markieren{%ends%}
* Feld Sprache ergänzen: {%s%}Button "Add Field" drücken, Sprache in das Feld name eingeben, als field type "string" auswählen und als multiValued markieren{%ends%}
* Feld LCC ergänzen: {%s%}Button "Add Field" drücken, LCC in das Feld name eingeben, als field type "string" auswählen und als multiValued markieren{%ends%}
* Feld DDC ergänzen: {%s%}Button "Add Field" drücken, DDC in das Feld name eingeben, als field type "string" auswählen und als multiValued markieren{%ends%}
* Feld Urheber ergänzen: {%s%}Button "Add Field" drücken, Urheber in das Feld name eingeben, als field type "string" auswählen und als multiValued markieren{%ends%}
* Feld Titel ergänzen: {%s%}Button "Add Field" drücken, Titel in das Feld name eingeben, als field type "string" auswählen und als multiValued markieren{%ends%}
* Feld Medientyp ergänzen: {%s%}Button "Add Field" drücken, Medientyp in das Feld name eingeben, als field type "string" auswählen und NICHT als multiValued markieren{%ends%}
* Feld Ort ergänzen: {%s%}Button "Add Field" drücken, Ort in das Feld name eingeben, als field type "string" auswählen und als multiValued markieren{%ends%}
* Feld Verlag ergänzen: {%s%}Button "Add Field" drücken, Verlag in das Feld name eingeben, als field type "string" auswählen und als multiValued markieren{%ends%}
* Feld Jahr ergänzen: {%s%}Button "Add Field" drücken, Jahr in das Feld name eingeben, als field type "TrieLong" auswählen und NICHT als multiValued markieren{%ends%}
* Feld Datum ergänzen: {%s%}Button "Add Field" drücken, Datum in das Feld name eingeben, als field type "string" auswählen und als multiValued markieren{%ends%}
* Feld Beschreibung ergänzen: {%s%}Button "Add Field" drücken, Beschreibung in das Feld name eingeben, als field type "string" auswählen und als multiValued markieren{%ends%}
* Feld Schlagwoerter ergänzen: {%s%}Button "Add Field" drücken, Schlagwoerter in das Feld name eingeben, als field type "string" auswählen und als multiValued markieren{%ends%}
* Feld Beitragende ergänzen: {%s%}Button "Add Field" drücken, Beitragende in das Feld name eingeben, als field type "string" auswählen und als multiValued markieren{%ends%}
* Feld Reihe ergänzen: {%s%}Button "Add Field" drücken, Reihe in das Feld name eingeben, als field type "string" auswählen und als multiValued markieren{%ends%}
* Feld Vorgaenger ergänzen: {%s%}Button "Add Field" drücken, Vorgaenger in das Feld name eingeben, als field type "string" auswählen und als multiValued markieren{%ends%}
* Feld Nachfolger ergänzen: {%s%}Button "Add Field" drücken, Nachfolger in das Feld name eingeben, als field type "string" auswählen und als multiValued markieren{%ends%}
* Feld Link ergänzen: {%s%}Button "Add Field" drücken, Link in das Feld name eingeben, als field type "string" auswählen und als multiValued markieren{%ends%}
