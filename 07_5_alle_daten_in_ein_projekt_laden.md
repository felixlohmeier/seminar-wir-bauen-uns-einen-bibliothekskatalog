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

Terminal 1: Beenden Sie zunächst OpenRefine auf der Kommandozeile (mit ```STRG+C```) und starten Sie die Version ```2.6rc2``` von OpenRefine mit dem obigen Befehl.

Starten Sie dann ein zweites Putty (Windows) bzw. ein zweites Terminal (Mac, Linux) und bauen Sie auch dort wie gewohnt eine SSH-Verbindung zum Webserver auf. Der Webserver erlaubt mehrere Logins mit dem gleichen Benutzernamen. Wenn Sie ```w``` eintippen, sehen Sie, dass zwei Verbindungen mit ```stud``` aufgebaut sind.

Terminal 2: {%s%}top eingeben und mehrfach > drücken, um die Sortierung bis zur Spalte RES zu verschieben. Die Spalte RES zeigt den Ressourcenverbrauch an Arbeitsspeicher für jeden Prozess. Wenn OpenRefine wie oben im Docker Startbefehl 3GB zugeteilt sind, dann darf diese Angabe niemals 3,0g überschreiten.{%ends%}

In der grafischen Oberfläche von OpenRefine:

* {%s%}Rufen Sie OpenRefine im Browser neu auf oder drücken Sie den Reload-Button im Browser, bis unten links bei der Version ```2.6-rc.2 [TRUNK]``` steht.{%ends%}
* {%s%}Create Project / Durchsuchen... / 100 Dateien auswählen / Next / Configure Parsing Options{%ends%}
* {%s%}Parse data as XML files{%ends%}
* {%s%}In der Vorschauansicht an die Stelle record xmlns="http://www.loc.gov/MARC21/slim" klicken{%ends%}
* {%s%}Checkbox "Store file source..." deaktivieren / Projektnamen vergeben (z.B. "100x marcxml") und Button "Create Project" drücken{%ends%}

Den Verbrauch an Arbeitsspeicher sehen Sie in Terminal 2 in ```top``` (etwa 700000 = 0,7 GB)


## Aufgabe 2: Wenden Sie die Transformationsregeln aus Kapitel 7.3 auf das neue Projekt an und beobachten Sie den Speicherbedarf

Hinweise:

* Beobachten Sie auch hier den Speicherbedarf während der Transformation. Beenden Sie anschließend den Docker-Container mit OpenRefine, starten Sie ihn neu und laden anschließend noch einmal das transformierte Projekt. Prüfen Sie erneut den Speicherbedarf.
* Nutzen Sie Ihre gespeicherten Transformationsregeln oder die aus der Datei [07_3.json](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_3.json). Achtung: Der Firefox-Browser hat unter Windows Probleme bei der Anzeige von Sonderzeichen (hier das verwendete Unit-Separator-Zeichen). Verwenden Sie daher unter Windows den Chrome-Browser zur Anzeige der Datei mit den Transformationsregeln.
* In der Version 2.6rc2 von OpenRefine ist ein [Bug in der Funktion Columnize by key/value columns](https://github.com/OpenRefine/OpenRefine/issues/1093), daher müssen wir für diese Aufgabe die Version 2.6rc1 oder die aktuelle Entwicklungsversion nutzen.

```
sudo docker run --rm -p 8888:3333 -v /home/stud/refine:/data felixlohmeier/openrefine:2.6rc1 -i 0.0.0.0 -m 3G -d /data
```

## Lösung

Terminal 1: {%s%}Beenden Sie zunächst OpenRefine auf der Kommandozeile (mit ```STRG+C```) und starten Sie die Version ```2.6rc1``` von OpenRefine mit dem obigen Befehl.{%ends%}

Terminal 2: {%s%}top eingeben und mehrfach > drücken, um die Sortierung bis zur Spalte RES zu verschieben (falls es nicht mehr läuft){%ends%}

In der grafischen Oberfläche von OpenRefine:

* {%s%}Rufen Sie OpenRefine im Browser neu auf. Unten links sollte jetzt die Version ```2.6-rc1 [TRUNK]``` stehen.{%ends%}
* {%s%}Unter "Open Project" das in Aufgabe 1 erstellte Projekt öffnen (z.B. "100x marcxml"){%ends%}
* {%s%}Menü oben links "Undo / Redo" aufrufen und Button "Apply..." drücken {%ends%}
* {%s%}Den Inhalt aus der Datei 07_3.json (siehe Link oben) in die Zwischenablage kopieren und in das Textfeld von "Apply" einfügen und Button "Perform Operations" drücken{%ends%}

Das Ergebnis sehen Sie in Terminal 2 in ```top``` (etwa 1,6 GB). Wenn Sie den Docker-Container neu starten und das fertig transformierte Projekt laden, dann wird weniger Arbeitsspeicher verbraucht (nur etwa 0,25 GB). Die Transformation der Daten hat also zu einem geringeren Ressourcenverbrauch geführt.


## Aufgabe 3: Erstellen Sie Projekte für alle 4.500 Dateien in geeigneten Paketgrößen

Die Erledigung dieser Aufgabe dauert etwa 2-3 Stunden.

Hinweise:

* Für das Projekt erstellen müssen Sie wieder die Version 2.6rc2 verwenden, wie in Aufgabe 1.
* Am wenigsten klicken müssen Sie, wenn Sie alle 4500 Dateien auf einmal laden. Dafür wird der Arbeitsspeicher aber nicht ausreichen, erst recht nicht, wenn Sie dann anschließend die Transformationen durchführen wollen.
* Machen Sie eine kleine Hochrechnung auf Basis des Speicherbedarfs aus Aufgabe 2, planen Sie mindestens 25% Reserve ein und wählen Sie auf dieser Basis die Größe ihrer "Pakete".
* OpenRefine räumt den Arbeitsspeicher erst nach längerer Zeit von alleine auf. Wenn Sie viele Projekte hintereinander erstellen könnte es auch hier zu Engpässen kommen. Stoppen Sie den Docker-Container am besten nach jedem erstellten Projekt und starten Sie ihn direkt wieder neu. Damit sind Sie auch sicher, dass die erstellten Projekte sauber abgespeichert werden.

## Lösung

Empfohlene Paketgröße: {%s%}45 Projekte mit je 100 Dateien bei 3GB Arbeitsspeicher für OpenRefine{%ends%}

Terminal: {%s%}sudo docker run --rm -p 8888:3333 -v /home/stud/refine:/data felixlohmeier/openrefine:2.6rc2 -i 0.0.0.0 -m 3G -d /data{%ends%}

In der grafischen Oberfläche von OpenRefine:

* {%s%}Create Project / Durchsuchen... / 100 Dateien auswählen / Next / Configure Parsing Options{%ends%}
* {%s%}Parse data as XML files{%ends%}
* {%s%}In der Vorschauansicht an die Stelle record xmlns="http://www.loc.gov/MARC21/slim" klicken{%ends%}
* {%s%}Checkbox "Store file source..." deaktivieren / Zweite Zahl im Projektnamen anpassen (um den Abschnitt eindeutig zu benennen, z.B. "haw_2016 10 25_000001 010000 marcxml") und Button "Create Project" drücken{%ends%}

## Aufgabe 4: Wenden Sie die Transformationsregeln aus Kapitel 7.3 auf alle in Aufgabe 3 erstellten Projekte an und exportieren Sie die Projekte einzeln als TSV

Die Erledigung dieser Aufgabe dauert etwa 3-4 Stunden. In Kapitel 7.8 lernen Sie später Möglichkeiten zur Automatisierung kennen.

Hinweise:

* Für das Anwenden der Transformationen müssen Sie die Version 2.6rc1 verwenden, wie in Aufgabe 2.
* Nutzen Sie Ihre gespeicherten Transformationsregeln oder die aus der Datei [07_3.json](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_3.json). Achtung: Der Firefox-Browser hat unter Windows Probleme bei der Anzeige von Sonderzeichen (hier das verwendete Unit-Separator-Zeichen). Verwenden Sie daher unter Windows den Chrome-Browser zur Anzeige der Datei mit den Transformationsregeln.
* Wählen Sie für den Export das Format "Tab separated value" (TSV) im Export-Menü oben rechts.
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

Terminal:

* Backup erstellen: {%s%}cp -r refine refine-backup{%ends%}
* OpenRefine in Version 2.6rc1 starten: {%s%}sudo docker run --rm -p 8888:3333 -v /home/stud/refine:/data felixlohmeier/openrefine:2.6rc1 -i 0.0.0.0 -m 3G -d /data{%ends%}

In der grafischen Oberfläche von OpenRefine alle Projekte nacheinander laden und jeweils die folgenden Schritte durchführen:

* Transformation: {%s%}Menü oben links "Undo / Redo" aufrufen und Button "Apply..." drücken. Den Inhalt aus der Datei 07_3.json in die Zwischenablage kopieren und in das Textfeld von "Apply" einfügen und Button "Perform Operations" drücken. Achtung: Der Firefox-Browser hat unter Windows Probleme bei der Anzeige von Sonderzeichen (hier das verwendete Unit-Separator-Zeichen). Verwenden Sie daher unter Windows den Chrome-Browser zur Anzeige der Datei mit den Transformationsregeln.{%ends%}
* Export: {%s%}Menü oben rechts Export / "Tab separated value" wählen. Der Download sollte automatisch beginnen. Speichern Sie die Daten lokal in einem beliebigen Verzeichnis.{%ends%}

Der Arbeitsspeicher von OpenRefine ist nach Bearbeitung eines einzelnen Projekts bereits fast voll und da OpenRefine nicht gut von selbst aufräumt (es hält die vorher geladenen Projekte noch eine ganze Weile im Speicher vor) und bei vollem Arbeitsspeicher sehr viel langsamer wird, sollten Sie OpenRefine nach jedem bearbeiteten Projekt im Terminal beenden und neu starten:

1. Beenden Sie OpenRefine mit ```STRG``` und ```C``` auf der Kommandozeile.
2. Starten Sie OpenRefine erneut, indem Sie auf der Kommandozeile mit der ```Pfeiltaste nach oben``` den vorigen Befehl auswählen und mit ```Enter``` ausführen.


## Aufgabe 5: Heruntergeladene TSV-Dateien auf den Webserver laden

Hinweise:

* Verwenden Sie ```scp``` wie in [Kapitel 6.3 Aufgabe 1](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/06_3_openrefine_starten_und_daten_laden.html)
* Legen Sie die Dateien in einem neuen Order ```tsv``` ab.

## Lösung

### Variante Windows

* Neuen Ordner tsv anlegen (Terminal): {%s%}cd ~ && mkdir tsv{%ends%}
* Mit WinSCP verbinden: {%s%}WinSCP.exe starten, Protokoll SCP auswählen, in das Feld "Host name" die IP-Adresse eingeben, Benutzername und Passwort eingeben und Login anklicken.{%ends%}
* Dateien übertragen: {%s%}Links das Verzeichnis mit den TSV-Dateien auswählen. Rechts in den Ordner "tsv" wechseln. TSV-Dateien auswählen und per Drag & Drop von links nach rechts schieben.{%ends%}

### Variante Mac/Linux

* Neuen Ordner tsv anlegen (Terminal): {%s%}cd ~ && mkdir tsv{%ends%}
* Terminal auf lokalem Rechner starten: {%s%}Terminal auf dem Betriebssystem (nicht auf der virtuellen Maschine) starten. In das Verzeichnis mit den TSV-Dateien wechseln.{%ends%}
* Dateien übertragen: {%s%}scp *.tsv stud@192.168.1.1:tsv/{%ends%}


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

Das ermöglicht uns mit dem Befehl aus Schritt 1 und ein paar Texttransformationen die Konfigurationsdatei automatisch zu generieren:

* Die Spalten müssen in die eckigen Klammern nach ```"columnNames":``` eingefügt werden.
* Die Spalten müssen von Anführungszeichen umschlossen sein.
* Zwischen den Spalten steht ein Komma (nach der letzten Spalte also keins!).

Literatur:

* Texttransformationen auf der Kommandozeile mit Unix Tools: [Introduction to text manipulation on UNIX-based systems](https://www.ibm.com/developerworks/aix/library/au-unixtext/)
* Beispiele für Texttransformationen mit ```sed```: [USEFUL ONE-LINE SCRIPTS FOR SED (Unix stream editor)](http://sed.sourceforge.net/sed1line.txt)

Lösungsansätze mit ```sed```:

* Spalten in Anführungszeichen setzen und ein Komma anfügen:  ```sed 's/^/"/' | sed 's/$/",/'```
* Anfang der Datei ergänzen: ```sed '1i [ { "op": "core/column-reorder", "description": "Reorder columns", "columnNames": ['```
* Ende der Datei ergänzen und das Komma bei der letzten Spalte entfernen: ```sed '$ s/,$/\n ] } ]/'```

Zusammen mit Schritt 1 ergibt das folgende Lösung:

```
head -q -n1 *.tsv | tr "\t" "\n" | sort | uniq | sed 's/^/"/' | sed 's/$/",/' | sed '1i [ { "op": "core/column-reorder", "description": "Reorder columns", "columnNames": [' | sed '$ s/,$/\n ] } ]/' > ~/07_5_all.json
```

In der Datei ```07_5_all.json``` haben Sie nun eine valide Transformationsdatei für OpenRefine, die alle in den Daten enthaltenen Felder alphabetisch sortiert.

Der letzte Teil des Befehls ```> ~/07_5_all.json``` sorgt übrigens dafür, dass die Datei im Verzeichnis ~ gespeichert wird, was ein Platzhalter für das Verzeichnis des aktuellen Nutzers (hier ```stud```) ist. Sie finden die Datei daher im "Hauptverzeichnis", in das Sie mit ```cd ~``` wechseln können.

**3) Nicht benötigte Spalten löschen**

Danach können wir die Datei mit ```nano 07_5_all.json``` bearbeiten und alle nicht benötigten Felder löschen, indem wir einfach die entsprechende Zeile der Datei entfernen. Je weniger Spalten enthalten sind, desto übersichtlicher wird die weitere Bearbeitung in den folgenden Kapiteln und desto geringer wird der Bedarf an Arbeitsspeicher.

Das Tastenkürzel in ```nano``` für das Speichern einer Datei unter einem anderem Namen lautet ```STRG``` und ```O``` (für "WriteOut").

Hier sind zwei Beispielkonfigurationen:

1. Alle Felder: [07_5_all.json](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_5_all.json)
2. Feldauswahl auf Basis von Zielschema [Dublin Core (unqualified)](http://www.loc.gov/marc/marc2dc.html): [07_5_minimal.json](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_5_minimal.json)

**4) Transformationsdatei auf Projekte mit bereits transformierten Daten anwenden und alle Projekte erneut als TSV exportieren**

Terminal:

* OpenRefine in Version 2.6rc1 oder 2.6rc2 starten: {%s%}sudo docker run --rm -p 8888:3333 -v /home/stud/refine:/data felixlohmeier/openrefine:2.6rc2 -i 0.0.0.0 -m 3G -d /data{%ends%}

In der grafischen Oberfläche von OpenRefine alle Projekte nacheinander laden und jeweils die folgenden Schritte durchführen:

* Transformation: Menü oben links "Undo / Redo" aufrufen und Button "Apply..." drücken. Den Inhalt aus der Datei [07_5_minimal.json](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_5_minimal.json) in die Zwischenablage kopieren und in das Textfeld von "Apply" einfügen und Button "Perform Operations" drücken. Achtung: Der Firefox-Browser hat unter Windows Probleme bei der Anzeige von Sonderzeichen (hier das verwendete Unit-Separator-Zeichen). Verwenden Sie daher unter Windows den Chrome-Browser zur Anzeige der Datei mit den Transformationsregeln.
* Export: Menü oben rechts Export / "Tab separated value" wählen. Der Download sollte automatisch beginnen. Speichern Sie die Daten lokal in einem beliebigen Verzeichnis.

Da die Projekte durch die vorherigen Transformationen wesentlich weniger Arbeitsspeicher benötigen, müssen Sie OpenRefine anders als bei Aufgabe 4 nicht mehr regelmäßig neu starten. Beachten Sie aber, dass Sie erst mit dem Beenden von OpenRefine sicher gehen können, dass alle Änderungen in den Projekten tatsächlich auf die Festplatte gespeichert wurden. Daher empfiehlt es sich trotzdem nach etwa 10 bearbeiteten Projekten den Docker-Container mit OpenRefine zu beenden und neu zu starten.

**5) Frisch heruntergeladene TSV-Dateien erneut auf den Webserver laden**

Wenn Sie die neu exportierten Dateien wie in Aufgabe 5 erneut auf den Webserver laden und wieder mit ```head -n1 *.tsv``` prüfen, dann werden Sie feststellen, dass nur diejenigen Spalten im Export enthalten sind, in denen auch tatsächlich Felder belegt sind.

Variante Windows:

* Dateien im Ordner tsv löschen (Terminal): ```cd ~/tsv && rm *.tsv```
* Mit WinSCP verbinden: WinSCP.exe starten, Protokoll SCP auswählen, in das Feld "Host name" die IP-Adresse eingeben, Benutzername und Passwort eingeben und Login anklicken.
* Dateien übertragen: Links das Verzeichnis mit den TSV-Dateien auswählen. Rechts in den Ordner "tsv" wechseln. TSV-Dateien auswählen und per Drag & Drop von links nach rechts schieben.

Variante Mac/Linux:

* Dateien im Ordner tsv löschen (Terminal): ```cd ~/tsv && rm *.tsv```
* Terminal auf dem Betriebssystem (nicht auf der virtuellen Maschine) starten. In das Verzeichnis mit den TSV-Dateien wechseln.
* Dateien übertragen: ```scp *.tsv stud@192.168.1.1:tsv/*```

Prüfung der Dateien (Terminal):

```
cd ~/tsv
head -n1 *.tsv
head -q -n1 *.tsv | tr "\t" "\n" | sort | uniq -c
```

## Aufgabe 7: Neues Projekt aus den TSV Dateien erstellen

Hinweise:

* OpenRefine führt unterschiedliche Datenstrukturen sinnvoll zusammen. Wenn die Dateien unterschiedlich viele Spalten oder eine andere Reihenfolge der Spalten haben, so ist das kein Problem. OpenRefine nimmt alle Spalten der ersten Datei auf und belegt diese mit neuen Zeilen. Sobald in einer weiteren Datei eine neue Spalte auftaucht, die OpenRefine noch nicht bekannt ist, so wird diese hinten angehängt. Das führt dazu, dass die Reihenfolge sich ändert. Wenn Sie wieder die alphabetische Sortierung der Spalten haben wollen, dann wenden Sie die Transformation aus Datei [07_5_minimal.json](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_5_minimal.json) einfach noch einmal an.
* Vermeiden Sie es, die Dateinamen von OpenRefine in den Daten speichern zu lassen. Das ist das Standardverhalten, kann aber mit einer Checkbox beim Import abgeschaltet werden.
* Wenn Sie nicht über ausreichend Arbeitsspeicher für OpenRefine verfügen und die Feldliste nicht vorab reduzieren können, dann müssen Sie wohl oder übel mit mehreren Projekten arbeiten. Das erschwert allerdings die Arbeit enorm, weil Sie die Feldbelegungen immer in mehreren Projekten prüfen müssen und Bezüge zwischen den Datensätzen schwerer herzustellen sind.

Bedarf an Arbeitsspeicher:

* Reduzierte Felder (07_5_minimal.json): etwa 2,5 GB

## Lösung

* {%s%}sudo docker run --rm -p 8888:3333 -v /home/stud/refine:/data felixlohmeier/openrefine:2.6rc2 -i 0.0.0.0 -m 3G -d /data{%ends%}
* {%s%}Create Project / Durchsuchen... / TSV Dateien auswählen / Next / Configure Parsing Options{%ends%}
* {%s%}Parse data as CSV / TSV / separator-based files{%ends%}
* {%s%}Character encoding: UTF-8{%ends%}
* {%s%}Checkbox "Store file source..." deaktivieren{%ends%}
* {%s%}Projektnamen vergeben (z.B. "haw komplett" und Button "Create Project" drücken{%ends%}

Damit haben Sie nun endlich alle Daten in einem einzelnen Projekt. Das ist die Grundlage, auf der das nächste Kapitel aufsetzt.