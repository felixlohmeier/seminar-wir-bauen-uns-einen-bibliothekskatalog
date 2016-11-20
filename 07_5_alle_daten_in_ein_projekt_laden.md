# 7.5 Alle Daten in ein Projekt laden

## Aufgabe 1: Laden Sie 100 MARCXML-Dateien in ein neues Projekt und beobachten Sie den Speicherbedarf

Hinweise:

* Auf dem Webserver können mit Sie mit dem Befehl ```top``` die aktuellen Prozesse und deren Speicherbedarf beobachten.
* Vermeiden Sie es, die Dateinamen von OpenRefine in den Daten speichern zu lassen. Das ist das Standardverhalten, kann aber mit einer Checkbox beim Import abgeschaltet werden.
* In der Version 2.6rc1 von OpenRefine ist ein **Bug im XML-Import von mehreren Dateien**, daher müssen wir für diese Aufgabe die Version 2.6rc2 oder die aktuelle Entwicklungsversion nutzen.

```
sudo docker run --rm -p 8888:3333 -v /home/stud/refine:/data felixlohmeier/openrefine:2.6rc2 -i 0.0.0.0 -m 3G -d /data
```

## Lösung

Putty zweimal starten und jeweils per SSH verbinden:

* Terminal 1: {%s%}top eingeben und mehrfach > drücken, um die Sortierung bis zur Spalte RES zu verschieben. Die Spalte RES zeigt den Ressourcenverbrauch an Arbeitsspeicher für jeden Prozess. Wenn OpenRefine wie oben im Docker Startbefehl 3GB zugeteilt sind, dann darf diese Angabe niemals 3,0g überschreiten.{%ends%}
* Terminal 2: {%s%}sudo docker run --name=refine-server --rm -p 8888:3333 -v /home/stud/refine:/data felixlohmeier/openrefine:2.6rc2 -i 0.0.0.0 -m 3G -d /data{%ends%}

In der grafischen Oberfläche von OpenRefine:

* {%s%}Create Project / Durchsuchen... / 100 Dateien auswählen / Next / Configure Parsing Options{%ends%}
* {%s%}Parse data as XML files{%ends%}
* {%s%}In der Vorschauansicht an die Stelle <record xmlns="http://www.loc.gov/MARC21/slim"> klicken{%ends%}
* {%s%}Checkbox "Store file source..." deaktivieren / Projektnamen vergeben und Button "Create Project" drücken{%ends%}

## Aufgabe 2: Wenden Sie die Transformationsregeln aus Kapitel 7.3 auf das neue Projekt an und beobachten Sie den Speicherbedarf

Hinweise:

* Beobachten Sie auch hier den Speicherbedarf während der Transformation. Beenden Sie anschließend den Docker-Container mit OpenRefine, starten Sie ihn neu und laden anschließend noch einmal das transformierte Projekt. Prüfen Sie erneut den Speicherbedarf.
* Nutzen Sie Ihre gespeicherten Transformationsregeln oder die aus der Datei [07_3.json](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_3.json)
* In der Version 2.6rc2 von OpenRefine ist ein [Bug in der Funktion Columnize by key/value columns](https://github.com/OpenRefine/OpenRefine/issues/1093), daher müssen wir für diese Aufgabe die Version 2.6rc1 oder die aktuelle Entwicklungsversion nutzen.

```
sudo docker run --rm -p 8888:3333 -v /home/stud/refine:/data felixlohmeier/openrefine:2.6rc1 -i 0.0.0.0 -m 3G -d /data
```

## Lösung

Putty zweimal starten wie in Lösung zu Aufgabe 1 und ```top``` weiterhin beobachten

In OpenRefine Projekt aus Aufgabe 1 laden und...

* {%s%}Menü oben links "Undo / Redo" aufrufen und Button "Apply..." drücken {%ends%}
* {%s%}Den Inhalt aus der Datei 07_3.json in die Zwischenablage kopieren und in das Textfeld von "Apply" einfügen und Button "Perform Operations" drücken{%ends%}

Speicherbedarf beim Laden von transformierten Projekten prüfen:

* {%s%}Docker-Container mit STRG+C beenden und noch gleich mit dem bekannten Kommando wieder starten{%ends%}
* {%s%}Im Browser das Projekt in OpenRefine laden und in top den Speicherbedarf prüfen.{%ends%}

## Aufgabe 3: Erstellen Sie Projekte für alle 4.500 Dateien in geeigneten Paketgrößen

Hinweise:

* Für das Projekt erstellen müssen Sie wieder die Version 2.6rc2 verwenden, wie in Aufgabe 1.
* Am wenigsten klicken müssen Sie, wenn Sie alle 4500 Dateien auf einmal laden. Dafür wird der Arbeitsspeicher aber nicht ausreichen, erst recht nicht, wenn Sie dann anschließend die Transformationen durchführen wollen.
* Machen Sie eine kleine Hochrechnung auf Basis des Speicherbedarfs aus Aufgabe 2, planen Sie mindestens 25% Reserve ein und wählen Sie auf dieser Basis die Größe ihrer "Pakete".
* OpenRefine räumt den Arbeitsspeicher erst nach längerer Zeit von alleine auf. Wenn Sie viele Projekte hintereinander erstellen könnte es auch hier zu Engpässen kommen. Stoppen Sie den Docker-Container am besten nach jedem erstellten Projekt und starten Sie ihn direkt wieder neu. Damit sind Sie auch sicher, dass die erstellten Projekte sauber abgespeichert werden.

## Lösung

* wie in Aufgabe 1
* Empfohlene Paketgröße: {%s%}30 Projekte mit je 150 Dateien bei 3GB Arbeitsspeicher für OpenRefine{%ends%}

## Aufgabe 4: Wenden Sie die Transformationsregeln auf alle in Aufgabe 3 erstellten Projekte an

Hinweise:

* Für das Anwenden der Transformationen müssen Sie die Version 2.6rc1 verwenden, wie in Aufgabe 2.
* Da Sie die viele Klickarbeit aus Aufgabe 3 bestimmt nicht wiederholen wollen, erstellen Sie zunächst eine Sicherheitskopie der Daten. Beenden Sie dazu den Dockercontainer und führen Sie den folgenden Kopierbefehl aus:

```
cp -r refine refine-backup
```

* Falls bei den Transformationen etwas schiefgehen sollte, können Sie die Daten aus dem Backup wie folgt zurückspielen:

```
rm -r -f refine
cp -r refine-backup refine
```

## Lösung

* wie in Aufgabe 2

## Aufgabe 5: Alle Projekte einzeln als TSV exportieren

Hinweise:

* Wählen Sie das Format Tab separated value (TSV) im Export-Menü oben rechts.

## Lösung

* {%s%}Projekte nacheinander in OpenRefine laden und im Menü oben rechts Export / "Tab separated value" wählen. Der Download sollte automatisch beginnen. Speichern Sie die Daten lokal in einem beliebigen Verzeichnis.{%ends%}

## Aufgabe 6: Neues Projekt aus den TSV Dateien erstellen

Hinweise:

* Vermeiden Sie es, die Dateinamen von OpenRefine in den Daten speichern zu lassen. Das ist das Standardverhalten, kann aber mit einer Checkbox beim Import abgeschaltet werden.
* Wenn der Arbeitsspeicher nicht ausreicht, um alle Daten in ein Projekt zu laden, dann müssen Sie wohl oder übel mit mehreren Projekten arbeiten.

## Lösung

* {%s%}Create Project / Durchsuchen... / TSV Dateien auswählen / Next / Configure Parsing Options{%ends%}
* {%s%}Parse data as CSV / TSV / separator-based files{%ends%}
* {%s%}Checkbox "Store file source..." deaktivieren / Projektnamen vergeben und Button "Create Project" drücken{%ends%}
