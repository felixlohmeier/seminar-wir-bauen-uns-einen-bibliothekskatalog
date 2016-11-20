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

* Empfohlene Paketgröße: {%s%}30 Projekte mit je 150 Dateien bei 3GB Arbeitsspeicher für OpenRefine{%ends%}
* Server starten: {%s%}sudo docker run --name=refine-server --rm -p 8888:3333 -v /home/stud/refine:/data felixlohmeier/openrefine:2.6rc2 -i 0.0.0.0 -m 3G -d /data{%ends%}

Projekte erstellen:

* {%s%}Create Project / Durchsuchen... / 150 Dateien auswählen / Next / Configure Parsing Options{%ends%}
* {%s%}Parse data as XML files{%ends%}
* {%s%}In der Vorschauansicht an die Stelle <record xmlns="http://www.loc.gov/MARC21/slim"> klicken{%ends%}
* {%s%}Checkbox "Store file source..." deaktivieren / Zweite Zahl im Projektnamen anpassen und Button "Create Project" drücken{%ends%}

## Aufgabe 4: Wenden Sie die Transformationsregeln aus Kapitel 7.3 auf alle in Aufgabe 3 erstellten Projekte an

Hinweise:

* Für das Anwenden der Transformationen müssen Sie die Version 2.6rc1 verwenden, wie in Aufgabe 2.
* Da Sie die viele Klickarbeit aus Aufgabe 3 bestimmt nicht wiederholen wollen, erstellen Sie zunächst eine Sicherheitskopie der Daten. Beenden Sie dazu den Dockercontainer und führen Sie den folgenden Kopierbefehl aus:

```
cp -r refine refine-backup_07_5-3
```

* Falls bei den Transformationen etwas schiefgehen sollte, können Sie die Daten aus dem Backup wie folgt zurückspielen:

```
rm -r -f refine
cp -r refine-backup_07_5-3 refine
```

## Lösung

In OpenRefine Projekte nacheinander laden und jeweils...

* Menü oben links "Undo / Redo" aufrufen und Button "Apply..." drücken.
* Den Inhalt aus der Datei [07_3.json](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_3.json) in die Zwischenablage kopieren und in das Textfeld von "Apply" einfügen und Button "Perform Operations" drücken.

## Aufgabe 5: Alle Projekte einzeln als TSV exportieren

Hinweise:

* Wählen Sie das Format Tab separated value (TSV) im Export-Menü oben rechts.

## Lösung

* {%s%}Projekte nacheinander in OpenRefine laden und im Menü oben rechts Export / "Tab separated value" wählen. Der Download sollte automatisch beginnen. Speichern Sie die Daten lokal in einem beliebigen Verzeichnis.{%ends%}

## Aufgabe 6: Spalten einheitlich sortieren (und nicht benötigte MARC-Felder löschen)

Schauen Sie sich die ersten Zeilen der TSV-Dateien mit ```head -n1 *.tsv``` an. Die verschiedenen Pakete enthalten sehr unterschiedliche Spalten und sie sind in unterschiedlicher Reihenfolge sortiert. Mit dem Befehl ```head -q -n1 *.tsv | tr "\t" "\n" | sort | uniq -c``` können Sie sich einen Überblick darüber verschaffen, wie oft eine Spalte in den verschiedenen TSV-Dateien vorkommt. Leider sind die Daten uneinheitlich codiert, so dass sehr viele unterschiedliche MARC-Felder belegt sind. Die daraus resultierende hohe Anzahl an Spalten stellt hohe Leistungsanforderungen an OpenRefine. Der Arbeitsspeicher wird vermutlich nicht ausreichen, um alle Daten in ein Projekt zu laden. Führen Sie die folgenden Schritte aus, um die Spalten einheitlich zu sortieren und die Anzahl der Felder zu reduzieren.

## Vorgehen

**1) Zwischenergebnis analysieren**

```head -q -n1 *.tsv | tr "\t" "\n" | sort | uniq -c```

Sie werden feststellen, dass manche Spalten sehr selten vorkommen. Sie können die [Dokumentation des MARC21 Formats](http://www.dnb.de/DE/Standardisierung/Formate/MARC21/marc21_node.html) konsultieren, um zu prüfen, ob Sie die Informationen aus diesen Feldern wirklich benötigen.

Ohne den Parameter ```-c``` erhalten Sie alle Spalten ohne Dubletten.

**2) Transformationsdatei für OpenRefine generieren**

Wenn Sie die Funktion ```All / Edit Columns / Re-order / remove columns...``` über die grafische Oberfläche durchführen und anschließend die Funktion ```Undo / Redo / Extract ...``` aufrufen, können Sie sich anschauen, wie die Transformationsregel in JSON definiert ist. Diese ist sehr einfach aufgebaut und sieht ungefähr so aus (in diesem Beispiel werden nur die Spalten A, B, C erhalten):

```
[
  {
    "op": "core/column-reorder",
    "description": "Reorder columns",
    "columnNames": [
       "A",
       "B",
       "C"
    ]
  }
]
```

Das ermöglicht uns mit dem Befehl aus Schritt 1 und ein paar Texttransformationen mit ```sed``` die Konfigurationsdatei automatisch zu generieren:

* Die Spalten müssen in die eckigen Klammern nach ```"columnNames":``` eingefügt werden.
* Die Spalten müssen von Anführungszeichen umschlossen sein.
* Zwischen den Spalten steht ein Komma (nach der letzten Spalte also keins!).

Lösungsansätze:

* Spalten in Anführungszeichen setzen und ein Komma anfügen:  ```sed 's/^/"/' | sed 's/$/",/'```
* Anfang der Datei ergänzen: ```sed '1i [ { "op": "core/column-reorder", "description": "Reorder columns", "columnNames": ['```
* Ende der Datei ergänzen und das Komma bei der letzten Spalte entfernen: ```sed '$ s/,$/\n ] } ]/'```

Zusammen mit Schritt 1 ergibt das folgende Lösung:

```
head -q -n1 *.tsv | tr "\t" "\n" | sort | uniq | sed 's/^/"/' | sed 's/$/",/' | sed '1i [ { "op": "core/column-reorder", "description": "Reorder columns", "columnNames": [' | sed '$ s/,$/\n ] } ]/' > 07_5-6_all.json
```

In der Datei ```07_5-6_all.json``` haben Sie nun eine valide Transformationsdatei für OpenRefine, die alle in den Daten enthaltenen Felder alphabetisch sortiert.

**3) Nicht benötigte Spalten löschen**

Danach können wir die Datei mit ```nano 07_5-6_all.json``` bearbeiten und alle nicht benötigten Felder löschen, indem wir einfach die entsprechende Zeile der Datei entfernen. Je weniger Spalten enthalten sind, desto übersichtlicher wird die weitere Bearbeitung in den folgenden Kapiteln und desto geringer wird der Bedarf an Arbeitsspeicher.

Hier sind zwei Beispielkonfigurationen:

1. Alle Felder: [07_5-6_all.json](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_5-6_all.json)
2. Nur Felder für [Dublin Core (unqualified)](http://www.loc.gov/marc/marc2dc.html): [07_5-6_minimal.json](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_5-6_minimal.json)

**4) Transformationsdatei auf Projekte mit bereits transformierten Daten anwenden**

In OpenRefine Projekte nacheinander laden und jeweils...

* Menü oben links "Undo / Redo" aufrufen und Button "Apply..." drücken.
* Den Inhalt aus der Datei [07_5-6_all.json](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_5-6_all.json) bzw. [07_5-6_minimal.json](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_5-6_minimal.json) in die Zwischenablage kopieren und in das Textfeld von "Apply" einfügen und Button "Perform Operations" drücken.

**5) Alle Projekte erneut als TSV exportieren**

Projekte nacheinander in OpenRefine laden und im Menü oben rechts Export / "Tab separated value" wählen. Der Download sollte automatisch beginnen. Speichern Sie die Daten lokal in einem beliebigen Verzeichnis.

Wenn Sie die exportierten Dateien wieder mit mit ```head -n1 *.tsv``` prüfen, dann werden Sie feststellen, dass nur diejenigen Spalten im Export enthalten sind, in denen auch tatsächlich Felder belegt sind.

## Aufgabe 7: Neues Projekt aus den TSV Dateien erstellen

Hinweise:

* OpenRefine führt unterschiedliche Datenstrukturen sinnvoll zusammen. Wenn die Dateien unterschiedlich viele Spalten oder eine andere Reihenfolge der Spalten haben, so ist das kein Problem. OpenRefine nimmt alle Spalten der ersten Datei auf und belegt diese mit neuen Zeilen. Sobald in einer weiteren Datei eine neue Spalte auftaucht, die OpenRefine noch nicht bekannt ist, so wird diese hinten angehängt. Das führt dazu, dass die Reihenfolge sich ändert. Wenn Sie wieder die alphabetische Sortierung der Spalten haben wollen, dann wenden Sie die Transformation aus Datei [07_5-6_all.json](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_5-6_all.json) bzw. [07_5-6_minimal.json](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_5-6_minimal.json) einfach noch einmal an.
* Vermeiden Sie es, die Dateinamen von OpenRefine in den Daten speichern zu lassen. Das ist das Standardverhalten, kann aber mit einer Checkbox beim Import abgeschaltet werden.
* Wenn Sie nicht über ausreichend Arbeitsspeicher für OpenRefine verfügen und die Feldliste nicht vorab reduzieren können, dann müssen Sie wohl oder übel mit mehreren Projekten arbeiten. Das erschwert allerdings die Arbeit enorm, weil Sie die Feldbelegungen immer in mehreren Projekten prüfen müssen und Bezüge zwischen den Datensätzen schwerer herzustellen sind.

Bedarf an Arbeitsspeicher:

* Reduzierte Felder (07_5-6_minimal.json): 2,78 GB

## Lösung

* {%s%}Create Project / Durchsuchen... / TSV Dateien auswählen / Next / Configure Parsing Options{%ends%}
* {%s%}Parse data as CSV / TSV / separator-based files{%ends%}
* {%s%}Character encoding: UTF-8{%ends%}
* {%s%}Checkbox "Store file source..." deaktivieren / Projektnamen vergeben und Button "Create Project" drücken{%ends%}

## Aufgabe 8: Prüfen, wie häufig Felder belegt sind

Sie können sich mit den Facetten in OpenRefine einen Überblick über die Belegung der Spalten verschaffen. Wählen Sie dazu ```Facet -> Customized facets -> Facet by blank```.

Alternativ können Sie TSV-Dateien auch auf der Kommandozeile durchzählen. Folgendes Script zählt alle Werte in den Spalten einer TSV-Datei.

### Vorgehen

```
#!/bin/bash
# Script zur Zählung von Feldbelegungen in TSV-Dateien
# Stand: 20.11.2016
# Nutzung: ./count-tsv.sh file.tsv

# Abfrage der Dateinamen
if [ -z "$1" ]
  then
    echo "Bitte Dateinamen angeben!"
    echo "Beispiel: ./count.sh file.tsv"
    exit
  else
    echo "Folgende Dateien werden untersucht:"
    files=($*)
    echo ${files[@]}
    echo ""
fi

# Schleife für mehrere Dateien
for file in "${files[@]}"; do

	# Spaltennamen erfassen
	readarray columns < <(head -q -n1 haw_000001_450200_minimal.tsv | tr '\t' '\n' | cat)

	# Belegte Zellen in Spalten zählen und ausgeben
	number=1
	for column in "${columns[@]}"; do
	echo -e ${column} "\t\t" $(cut -d$'\t' -f ${number} ${file} | grep -v '^$' | wc -l)
	number=$(($number+1))
	done
done
```

Script als Datei: [count-tsv.sh](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/scripte/count-tsv.sh)

**Ausführen:**

* Script mit ```curl``` auf den Server laden: ```curl -O https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/scripte/count-tsv.sh```
* Script ausführbar machen: ```chmod +x count-tsv.sh```
* Script starten mit ```./count-tsv.sh```

### Ergebnis

Folgende Spalten sind weniger als 10x belegt und könnten wohl gelöscht werden:

| Spalte  | Anzahl belegter Felder  |
|---|---|
|	082 : c 	|	2	|
|	100 : 6 	|	2	|
|	100 : h 	|	2	|
|	535 : a 	|	2	|
|	551 : 5 	|	2	|
|	583 : c 	|	2	|
|	600 : e 	|	2	|
|	600 : l 	|	2	|
|	600 : p 	|	2	|
|	610 : d 	|	2	|
|	610 : g 	|	2	|
|	610 : l 	|	2	|
|	630 : p 	|	2	|
|	650 : b 	|	2	|
|	650 : d 	|	2	|
|	651 : s 	|	2	|
|	653 : f 	|	2	|
|	653 : x 	|	2	|
|	700 : t 	|	2	|
|	700 : v 	|	2	|
|	700 : w 	|	2	|
|	751 : 9 	|	2	|
|	502 : g 	|	3	|
|	511 : e 	|	3	|
|	611 : x 	|	3	|
|	630 : 2 	|	3	|
|	630 : f 	|	3	|
|	630 : s 	|	3	|
|	100 : m 	|	4	|
|	100 : r 	|	4	|
|	550 : x 	|	4	|
|	630 : l 	|	4	|
|	653 : t 	|	4	|
|	700 : 5 	|	4	|
|	776 : o 	|	4	|
|	611 : v 	|	5	|
|	653 : h 	|	5	|
|	710 : 9 	|	5	|
|	711 : 0 	|	5	|
|	711 : 2 	|	5	|
|	100 : n 	|	6	|
|	510 : x 	|	7	|
|	600 : z 	|	7	|
|	100 : p 	|	8	|
|	551 : x 	|	8	|
|	653 : g 	|	8	|
|	655 : x 	|	8	|
|	700 : 6 	|	8	|
|	610 : y 	|	9	|

### Transformation anwenden

Wenn Sie die geringfügig belegten Felder löschen wollen, dann wenden Sie die folgende Transformationsdatei an.

* Menü oben links "Undo / Redo" aufrufen und Button "Apply..." drücken.
* Den Inhalt aus der Datei [07_5-8_reduzieren.json](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_5-8_reduzieren.json) in die Zwischenablage kopieren und in das Textfeld von "Apply" einfügen und Button "Perform Operations" drücken.