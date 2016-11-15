# 7.5 Alle Daten in ein Projekt laden

## Aufgabe 1: Laden Sie 100 MARCXML-Dateien in ein neues Projekt und beobachten Sie den Speicherbedarf

Hinweise:

* Auf dem Webserver können mit Sie mit dem Befehl ```top``` die aktuellen Prozesse und deren Speicherbedarf sehen.
* Vermeiden Sie es, die Dateinamen von OpenRefine in den Daten speichern zu lassen. Dafür gibt es eine Checkbox beim Import.

## Aufgabe 2: Wenden Sie die Transformationsregeln aus Kapitel 7.3 auf das neue Projekt an

Hinweise:
* Beobachten Sie auch hier den Speicherbedarf und notieren Sie sich die Laufzeit.
* Nutzen Sie Ihre gespeicherten Transformationsregeln oder die aus der Datei [07_3.json](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_3.json)

## Aufgabe 3: Wenden Sie die Transformationsregeln aus Kapitel 7.3 auf alle 4500 Datensätze an

Hinweise:
* Am wenigsten klicken müssen Sie, wenn Sie alle 4500 Dateien auf einmal laden. Dann wird OpenRefine jedoch nicht genug Arbeitsspeicher zur Verfügung haben, um alle Transformationen durchzuführen.
* Machen Sie eine kleine Hochrechnung auf Basis des Speicherbedarfs aus Aufgabe 2, planen Sie mindestens 25% Reserve ein und wählen Sie auf dieser Basis die Größe ihrer "Pakete".