# 7.8 Automatisierung

Die Systemarchitektur von OpenRefine macht es möglich, die Anwendung nicht nur über die grafische Oberfläche, sondern auch über eine API "fernzusteuern". Im Punkt zur Systemarchitektur in der [Dokumentation für Entwickler](https://github.com/OpenRefine/OpenRefine/wiki/Documentation-For-Developers) heißt es:

>"And it's possible to make the server-side scriptable from the command line."

Das machen wir uns zunutze. Die [HTTP-API von OpenRefine](https://github.com/OpenRefine/OpenRefine/wiki/OpenRefine-API) kann theoretisch auch direkt angesprochen werden, aber da sie nur rudimentär dokumentiert ist, nutzen wir einen der verschiedenen Clients, die andere schon gegen die HTTP-API von OpenRefine entwickelt haben. Es gibt Clients in Python, Ruby, node.js, PHP und für R. Am ausgereiftesten ist der [Python-Client von Paul Makepeace](https://github.com/PaulMakepeace/refine-client-py/).

Der Client kann ebenso wie OpenRefine lokal installiert werden. Um die Installation und Bedienung zu vereinfachen, habe ich einen Docker-Container gebaut (vgl. [Repository felixlohmeier/openrefine in Docker Hub](https://hub.docker.com/r/felixlohmeier/openrefine/)).

## Aufgabe 1: Starten Sie den Python-Client und geben Sie eine Liste der Projekte aus

Hinweise:

* Die Bedienung ist im Abschnitt "**batch processing with python-client**" im [Repository in Docker Hub](https://hub.docker.com/r/felixlohmeier/openrefine/)) beschrieben. Schauen Sie sich die unter der Überschrift "example for customized run command in interactive mode (e.g. for usage in terminals)" gelisteten Docker-Startbefehle an und wandeln Sie diese so ab, dass sie mit den Parametern im [Kapitel 6.3](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/06_3_openrefine_starten_und_daten_laden.html) beschriebenen Docker-Startbefehl zusammen passen.
* **Starten Sie zwei SSH-Verbindungen** (Windows: 2x Putty; Mac/Linux: 2x Terminal). Dann können Sie den Server im ersten Fenster (nennen wir dies im Folgenden Terminal 1) starten und den Client im Zweiten (nennen wir dies im Folgenden Terminal 2).

## Lösung

* Terminal 1: Server starten: {%s%}sudo docker run --name=refine-server --rm -p 8888:3333 -v /home/stud/refine:/data felixlohmeier/openrefine:2.6rc1 -i 0.0.0.0 -m 3G -d /data{%ends%}
* Terminal 2: Python-Client: {%s%}sudo docker run --link refine-server --rm -v /home/stud/refine:/data felixlohmeier/openrefine:client-py{%ends%}


## Aufgabe 2: Erstellen Sie ein weiteres Backup und stellen Sie das alte Backup aus Kapitel 7.3 wiederher

In Kapitel 7.5, Aufgabe 4 haben Sie ein Backup des Arbeitsverzeichnisses von OpenRefine erstellt. Das werden wir jetzt wiederherstellen. Aber vorher erstellen wir noch ein weiteres aktuelles Backup, falls etwas schiefgehen sollte.

## Vorgehen

```
cd ~
cp -r refine refine-backup-fertig-manuell
sudo rm -r -f refine
cp -r refine-backup refine
```

Damit haben wir den Stand von Kapitel 7.5, Aufgabe 4 wiederhergestellt.

## Aufgabe 3: Wenden Sie gespeicherte Transformationsregeln auf ein Projekt an

Hinweise:

* Nutzen Sie entweder Ihre selbst erstellten Transformationsregeln aus [Kapitel 7.3](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/07_3_fuer_jedes_marc-feld_eine_spalte.html) oder die aus der folgenden Datei: [07_3.json](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_3.json). Speichern Sie diese Transformationsregeln in einer Datei auf dem Webserver, z.B. **a)** über die Zwischenablage mit ```nano``` (vgl. [Kapitel 3.5](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/03_5_uebung_text_ueber_die_konsole_erstellen.html))
ODER **b)** laden Sie die Datei mit ```curl``` (vgl. [Kapitel 4.2](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/04_2_uebung_unapi-schnittstelle_des_gbv.html). Die Datei muss im Arbeitsverzeichnis liegen (in unserem Beispiel also in ```/home/stud/refine/```).
* Für die Transformationen aus Kapitel 7.3 müssen Sie die Version 2.6rc1 von OpenRefine nutzen (vgl. Kapitel 7.3)

## Lösung

* Terminal 1 - Server starten: {%s%}sudo docker run --name=refine-server --rm -p 8888:3333 -v /home/stud/refine:/data felixlohmeier/openrefine:2.6rc1 -i 0.0.0.0 -m 3G -d /data{%ends%}
* Terminal 2 - Projekte auslesen: {%s%}sudo docker run --link refine-server --rm -v /home/stud/refine:/data felixlohmeier/openrefine:client-py{%ends%}
* Terminal 2 - Projekt-ID notieren: {%s%}Notieren Sie die Nummer eines der vielen Projekte, die noch nicht transformiert wurden, z.B. die ID zu Projektname "haw_2016 10 25_440001 450200 marcxml"{%ends%}
* Terminal 2 - Transformationsdatei erstellen (hier Variante b mit curl): {%s%}curl https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_3.json > ~/refine/07_3.json{%ends%}
* Terminal 2 - Transformationen anwenden (1234567890123 durch Projekt-ID ersetzen): {%s%}sudo docker run --link refine-server --rm -v /home/stud/refine:/data felixlohmeier/openrefine:client-py -f 07_3.json 1234567890123{%ends%}

## Ergebnis

* Beobachten Sie die Rückmeldungen in den Terminals. Wenn der Prozess fertig ist, erscheint in Terminal 2 (Client) unscheinbar wieder die Eingabezeile. In Terminal 1 (Server) ist die Fertigstellung nicht direkt ersichtlich.
* Prüfen Sie nach Fertigstellung das Ergebnis, indem Sie das Projekt im Browser öffnen. Die Daten sollten jetzt transformiert sein und rund 10.000 rows/records anzeigen.


## Aufgabe 4: Exportieren Sie mit dem Python-Client die Daten aus einem Projekt als TSV

Hinweise:

* Auch der dafür notwendige Befehl ist im [Repository in Docker Hub](https://hub.docker.com/r/felixlohmeier/openrefine/)) beschrieben.

## Lösung

* Terminal 1 - Server starten: {%s%}sudo docker run --name=refine-server --rm -p 8888:3333 -v /home/stud/refine:/data felixlohmeier/openrefine:2.6rc1 -i 0.0.0.0 -m 3G -d /data{%ends%}
* Terminal 2 - Daten exportieren (1234567890123 durch Projekt-ID aus Aufgabe 2 ersetzen): {%s%}sudo docker run --link refine-server --rm -v /home/stud/refine:/data felixlohmeier/openrefine:client-py -E --output=test.tsv 1234567890123{%ends%}
* Terminal 2 - Daten anzeigen: {%s%}cat ~/refine/test.tsv | more{%ends%}


## Aufgabe 5: Schreiben Sie ein Shell-Script, dass Server und Client startet, die Transformation durchführt und dann die Daten als TSV exportiert

Hinweise:

* Schauen Sie sich die Grundlagen für Shell-Scripte in [Kapitel 4.4](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/04_4_download_der_metadaten.html), Aufgabe 3 nochmal an.
* Shell-Scripte führen die im Script enthaltenen Befehle Zeile für Zeile einen nach dem anderen aus, sobald der vorige Befehle abgeschlossen ist. Bislang haben wir den OpenRefine-Server im interaktiven Modus gestartet, d.h. der Startbefehl kommt nie von alleine zu Ende und würde die Bearbeitung des restlichen Teils vom Script blockieren. Verwenden Sie daher im Startbefehl des Servers den Parameter ```-d``` anstelle von ```--rm```. Der Server läuft dann endlos im Hintergrund. Sie müssen ihn abschließend manuell beenden mit dem Befehl ```sudo docker stop refine-server``` und löschen mit ```sudo docker rm refine-server```
* Der Docker-Container mit dem Server muss vollständig gestartet sein, bevor Sie den Client starten können, denn sonst liefe dieser ins Leere. Daher sollten Sie eine gewisse Wartezeit einbauen, z.B. mit dem Befehl ```sleep 15```.
* Verwenden Sie stets ein anderes, unbearbeitetes Projekt für Ihre Tests. Wenn Sie Transformationsregeln ein zweites Mal auf ein Projekt anwenden, dann laufen die Transformationen auf den bereits transformierten Daten ab. Das führt mit Sicherheit zu unerwünschten Ergebnissen.

## Lösung

Erläuterungen folgen direkt in den Skripten mit ```#```. Die erste Variante ist der einfachere Lösungsweg, aber nicht so komfortabel. Verwenden Sie Variante 2, wenn Sie damit richtig arbeiten wollen.

### Variante 1: Transformations+Export-Script "minimal"

```
#!/bin/bash
# Script zur Transformation und zum Export von Projekten mit OpenRefine
# Variante "minimal", Stand: 18.11.2016
# Voraussetzungen:
# 1. Docker
# 2. OpenRefine-Projekte im Arbeitsverzeichnis /home/stud/refine
# 3. Transformationsdatei 07_3.json im Ordner /home/stud/refine
# 4. IDs der zu verarbeitenden Projekte im Script definiert

# Definieren Sie hier die Projekte, die verarbeitet werden sollen!
# Geben Sie dazu die vierzehnstelligen Projektnummern von OpenRefine in die Klammern ein.
# Mehrere Projekte werden mit Leerzeichen getrennt.
projects=(01234567890123 12345678901234)

# Server starten und 15 Sekunden warten
sudo docker run -d --name=refine-server -p 8888:3333 -v /home/stud/refine:/data felixlohmeier/openrefine:2.6rc1 -i 0.0.0.0 -m 3G -d /data
sleep 15

# Anfang der Schleife für die definierten Projekte
for projectid in "${projects[@]}" ; do

    # Transformationen durchführen
    sudo docker run --rm --link refine-server -v /home/stud/refine:/data felixlohmeier/openrefine:client-py -f 07_3.json ${projectid}

    # Daten exportieren
    sudo docker run --rm --link refine-server -v /home/stud/refine:/data felixlohmeier/openrefine:client-py -E --output=${projectid}.tsv ${projectid}

# Ende der Schleife für die definierten Projekte
done

# Server beenden und Container löschen
sudo docker stop refine-server
sudo docker rm refine-server

exit
```

**Ausführen:**

* Diesen Textinhalt in einer Datei abspeichern, z.B. mit ```nano transform+export-minimal.sh```
* IDs der zu verarbeitenden Projekte in der sechsten Zeile des Scripts eingeben. Wählen Sie dazu zwei bislang unbearbeitete Projekte aus. Sie können die Projekt-IDs auch im Browser im Menüpunkt "Open Project" anhand der Links ablesen (project=...)
* Script ausführbar machen: ```chmod +x transform+export-minimal.sh```
* Transformationsdatei 07_3.json in das Arbeitsverzeichnis laden, falls noch nicht vorhanden: ```curl https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_3.json > ~/refine/07_3.json```
* OpenRefine beenden, falls es im anderen Terminal noch laufen sollte.
* Script starten mit ```./transform+export-minimal.sh```

Das Script hat eine Laufzeit von etwa 5-10 Minuten für 2 Projekte. Währenddessen gibt es keine Rückmeldungen zum Status, also haben Sie etwas Geduld. Wenn das Script fertig gelaufen ist, erscheint wieder die Eingabezeile. Prüfen Sie die beiden transformierten Projekte im Browser. Dazu müssen Sie zunächst wieder OpenRefine manuell starten.

### Variante 2: Transformations+Export-Script "Komfort"

Wie Variante 1 mit folgenden Verbesserungen:

* Die IDs der zu verarbeitenden Projekte können nun an den Befehl zum Aufruf des Scripts angehängt werden. Wenn keine Projekt-IDs angegeben werden, dann werden diejenigen Projekte verarbeitet, deren Name mit dem Codewort (voreingestellt: ```TRANSFORM```) beginnt. Dazu werden die vorhandenen Projekte ausgelesen und daraus die Projektnummern mit einem grep-Befehl ausgefiltert und in eine Variable geschrieben.
* Die anzuwendenden Transformationsdateien werden zu Beginn in einer Variable ```jsonfiles``` definiert (voreingestellt: 07_3.json und 07_5_minimal.json) und können direkt im Script geändert werden). Das Script wendet diese Transformationsdateien in der genannten Reihenfolge auf alle zu verarbeitenden Projekte an. Um Arbeitsspeicher zu schonen, wird der Docker-Container mit OpenRefine nach jeder Transformation neu gestartet.
* Das Script lädt selbsttätig die aktuellen Transformationsdateien aus dem Script in Gitbook, d.h. aus dem Verzeichnis https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/ in das Arbeitsverzeichnis von OpenRefine und überschreibt ggf. gleichlautende Dateien.
* Der Server wird für jedes Projekt einzeln gestartet und beendet, damit der Arbeitsspeicher nicht voll läuft.
* Statt der festen Wartezeit (sleep 15) erfolgt eine Abfrage, ob der Server erreichbar ist, bevor das Script fortschreitet. Das beschleunigt die Verarbeitung, wenn der Server schneller als in 15 Sekunden startet und beugt Fehlern vor, falls der Server ausgelastet ist und mal länger als 15 Sekunden braucht.
* Am Ende werden zur Erfolgskontrolle die exportierten TSV-Dateien ausgegeben.
* Das Script gibt die Konfigurationswerte sowie regelmäßig Start- und Endzeitpunkte aus.
* Arbeitsverzeichnis, Port und maximaler Arbeitsspeicher für den OpenRefine-Server werden zu Beginn als Variable definiert (Standard: ```/home/stud/refine/```, ```8888```, ```3G```), was eine Anpassung später leichter macht.

**Script als Datei: [transform+export.sh](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/scripte/transform+export.sh)**

**Ausführen:**

* OpenRefine starten und im Menüpunkt "Open Project" ein bislang unbearbeitetes Projekt umbenennen. Der Link zum Umbenennen erscheint, wenn Sie mit der Maus neben das Änderungsdatum fahren. Schreiben Sie ```TRANSFORM``` vor den Projektnamen.
* OpenRefine beenden und Container löschen (falls noch etwas läuft oder der Container aufgrund eines Fehlers nicht richtig gelöscht wurde): ```sudo docker stop refine-server && sudo docker rm refine-server```
* Script mit ```curl``` auf den Server laden: ```curl -O https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/scripte/transform+export.sh```
* Script ausführbar machen: ```chmod +x transform+export.sh```
* Script starten mit ```./transform+export.sh```

Das Script gibt jetzt auch Rückmeldungen zum aktuellen Status, manche Meldungen sind aber vielleicht irritierend:

* Die Meldung "(23) Failed writing body" können Sie ignorieren, falls diese erscheinen sollte, das macht nichts ;-).
* Am Ende werden schließlich alle TSV-Dateien gelistet, die im Arbeitsverzeichnis liegen. Daher tauchen auch die TSV-Dateien aus der vorigen Aufgabe mit auf.

Prüfen Sie die transformierten Projekte im Browser. Dazu müssen Sie zunächst wieder OpenRefine manuell starten.


## Aufgabe 6: Führen Sie mit dem Script ALLE Transformationsschritte aus Kapitel 7 durch

Hinweise:

* Stellen Sie das Backup aus Kapitel 7.5 wieder her, um einen sauberen Ausgangszustand zu erreichen. Löschen Sie im Browser die Testprojekte aus früheren Aufgaben, so dass nur die 45 Projekte mit 10000er Schnipseln verbleiben.
* Da das Script bzw. der Python-Client keine Projekte erstellen kann, müssen Sie Kapitel 7.5, Aufgabe 7 manuell durchführen. Sie können das Script für die Teil davor und danach einsetzen.
* Passen Sie die Zeile ```jsonfiles=(07_3.json 07_5_minimal.json)``` im Script so an, dass alle in Kapitel 7.3-7.7 verwendeten Transformationsdateien in der richtigen Reihenfolge abgearbeitet werden.
* Passen Sie die Zeile ```codewort="TRANSFORM"``` im Script so an, dass alle gewünschten Projekte bearbeitet werden.

## Lösung

**Teil 1: mit Script**

* Arbeitsverzeichnis löschen: {%s%}sudo rm -r -f refine{%ends%}
* Backup aus Kapitel 7.5, Aufgabe 3 wiederherstellen: {%s%}cp -r refine-backup refine{%ends%}
* OpenRefine starten: {%s%}sudo docker run --name=refine-server --rm -p 8888:3333 -v /home/stud/refine:/data felixlohmeier/openrefine:2.6rc1 -i 0.0.0.0 -m 3G -d /data{%ends%}
* OpenRefine im Browser aufrufen und Projekte löschen: {%s%}Menü "Open Project" öffnen und Projekte löschen, so dass nur die 45 Projekte mit 10000er Schnipseln verbleiben (gemäß Aufgaben im Script müssten also drei ältere Projekte gelöscht werden, die in der Liste noch unter "haw_2016 10 25_000001 010000 marcxml" stehen sollten){%ends%}
* OpenRefine beenden
* Script mit ```curl``` auf den Server laden: {%s%}curl -O https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/scripte/transform+export.sh{%ends%}
* Script ausführbar machen: {%s%}chmod +x transform+export.sh{%ends%}
* Script anpassen: {%s%}nano transform+export.sh und die Zeile codewort="TRANSFORM" durch codewort="haw" ersetzen.{%ends%}
* Script ausführen (Achtung: Mehrere Stunden Laufzeit!): {%s%}./transform+export.sh{%ends%}

**Teil 2: manuell**

Ergebnis herunterladen und aufräumen:
* TSV-Dateien herunterladen: {%s%}vgl. Lösung in Kapitel 6.3, Aufgabe 1{%ends%}
* Arbeitsverzeichnis leeren: {%s%}sudo rm -r -f refine/*{%ends%}

Projekt anlegen:
* OpenRefine starten: {%s%}sudo docker run --rm -p 8888:3333 -v /home/stud/refine:/data felixlohmeier/openrefine:2.6rc2 -i 0.0.0.0 -m 3G -d /data{%ends%}
* {%s%}Create Project / Durchsuchen... / Alle TSV Dateien auswählen / Next / Configure Parsing Options{%ends%}
* {%s%}Parse data as CSV / TSV / separator-based files{%ends%}
* {%s%}Character encoding: UTF-8{%ends%}
* {%s%}Checkbox "Store file source..." deaktivieren / Projektnamen "haw-prozessiert-script" vergeben und Button "Create Project" drücken{%ends%}
* OpenRefine beenden

**Teil 3: mit Script**

* Script anpassen: {%s%}nano transform+export.sh und die Zeile jsonfiles=(07_3.json 07_5_minimal.json) durch jsonfiles=(07_5_minimal.json 07_6-2.json 07_6-4.json 07_6-5.json 07_6-6.json 07_6-7.json 07_6-8.json) ersetzen.{%ends%}
* Script ausführen: {%s%}./transform+export.sh{%ends%}

## Ergebnis

Die Datei ```haw-prozessiert-script.tsv``` im Ordner ~/refine/ ist das Endergebnis der Verarbeitung. Sie können diese Datei mit der vorher manuell erstellten Datei ```haw-prozessiert.tsv im Ordner``` ~/tsv/ vergleichen. Im Idealfall sollte das folgende Kommando keine Differenz zwischen den beiden Dateien feststellen können:

```
diff ~/refine/haw-prozessiert-script.tsv ~/tsv/haw-prozessiert.tsv
```

## Literatur

* In der Rubrik [häufig gestellte Fragen (FAQ)]((https://github.com/OpenRefine/OpenRefine/wiki/FAQ)) der OpenRefine Dokumentation stehen auch ein paar Tipps, wie OpenRefine programmatisch als Server genutzt werden kann.
