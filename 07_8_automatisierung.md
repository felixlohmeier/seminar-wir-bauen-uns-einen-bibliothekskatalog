# 7.8 Automatisierung

Die Systemarchitektur von OpenRefine macht es möglich, die Anwendung nicht nur über die grafische Oberfläche, sondern auch über eine API "fernzusteuern". Im Punkt zur Systemarchitektur in der [Dokumentation für Entwickler](https://github.com/OpenRefine/OpenRefine/wiki/Documentation-For-Developers) heißt es:

>"And it's possible to make the server-side scriptable from the command line."

Das machen wir uns zunutze. Die [HTTP-API von OpenRefine](https://github.com/OpenRefine/OpenRefine/wiki/OpenRefine-API) kann theoretisch auch direkt angesprochen werden, aber da sie nur rudimentär dokumentiert ist, nutzen wir einen der verschiedenen Clients, die andere schon gegen die HTTP-API von OpenRefine entwickelt haben. Es gibt Clients in Python, Ruby, node.js, PHP und für R. Am ausgereiftesten ist der [Python-Client von Paul Makepeace](https://github.com/PaulMakepeace/refine-client-py/).

Der Client kann ebenso wie OpenRefine lokal installiert werden. Um die Installation und Bedienung zu vereinfachen, habe ich einen Docker-Container gebaut (vgl. [Repository felixlohmeier/openrefine in Docker Hub](https://hub.docker.com/r/felixlohmeier/openrefine/)).

## Aufgabe 1: Starten Sie den Python-Client und geben Sie eine Liste der Projekte aus

Hinweise:

* Die Bedienung ist im Abschnitt "**batch processing with python-client**" im [Repository in Docker Hub](https://hub.docker.com/r/felixlohmeier/openrefine/)) beschrieben. Schauen Sie sich die unter der Überschrift "example for customized run command in interactive mode (e.g. for usage in terminals)" gelisteten Docker-Startbefehle an und wandeln Sie diese so ab, dass sie mit den Parametern im [Kapitel 6.3](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/06_3_openrefine_starten_und_daten_laden.html) beschriebenen Docker-Startbefehl zusammen passen.
* **Starten Sie Putty zweimal** und bauen Sie jeweils eine SSH-Verbindung auf. Dann können Sie den Server im ersten Putty-Fenster (nennen wir dies im Folgenden Terminal 1) starten und den Client im Zweiten (nennen wir dies im Folgenden Terminal 2).

## Lösung

* Terminal 1: Server starten: {%s%}sudo docker run --name=refine-server --rm -p 8888:3333 -v /home/stud/refine:/data felixlohmeier/openrefine:2.6rc1 -i 0.0.0.0 -m 3G -d /data{%ends%}
* Terminal 2: Python-Client: {%s%}sudo docker run --link refine-server --rm -v /home/stud/refine:/data felixlohmeier/openrefine:client-py{%ends%}

## Aufgabe 2: Wenden Sie die in Kap. 7.3 gespeicherten Transformationsregeln auf ein neues Projekt an

Hinweise:

* Erstellen Sie ein neues Projekt auf gewohnte Weise (vgl. [Kapitel 6.3](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/06_3_openrefine_starten_und_daten_laden.html), Aufgabe 2)
* Nutzen Sie entweder Ihre selbst erstellten Transformationsregeln aus [Kapitel 7.3](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/07_3_fuer_jedes_marc-feld_eine_spalte.html) oder die aus der folgenden Datei: [07_3.json](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_3.json). Speichern Sie diese Transformationsregeln in einer Datei auf dem Webserver, z.B. **a)** über die Zwischenablage mit ```nano``` (vgl. [Kapitel 3.5](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/03_5_uebung_text_ueber_die_konsole_erstellen.html))
ODER **b)** laden Sie die Datei mit ```curl``` (vgl. [Kapitel 4.2](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/04_2_uebung_unapi-schnittstelle_des_gbv.html). Die Datei muss im Arbeitsverzeichnis liegen (in unserem Beispiel also in ```/home/stud/refine/```).

## Lösung

* Terminal 1 - Server starten: {%s%}sudo docker run --name=refine-server --rm -p 8888:3333 -v /home/stud/refine:/data felixlohmeier/openrefine:2.6rc1 -i 0.0.0.0 -m 3G -d /data{%ends%}
* Browser: {%s%}OpenRefine aufrufen und ein neues Projekt erstellen (vgl. Kapitel 6.3, Aufgabe 2){%ends%}
* Terminal 2 - Projekte auslesen: {%s%}sudo docker run --link refine-server --rm -v /home/stud/refine:/data felixlohmeier/openrefine:client-py{%ends%}
* Terminal 2 - Projekt-ID notieren: {%s%}Notieren Sie die Nummer des gerade erstellten Projekts{%ends%}
* Terminal 2 - Transformationsdatei erstellen (hier Variante b mit curl): {%s%}curl https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_3.json > /home/stud/refine/07_3.json {%ends%}
* Terminal 2 - Transformationen anwenden (1234567890123 durch Projekt-ID ersetzen): {%s%}sudo docker run --link refine-server --rm -v /home/stud/refine:/data felixlohmeier/openrefine:client-py -f 07_3.json 1234567890123{%ends%}

## Aufgabe 3: Exportieren Sie mit dem Python-Client die Daten aus einem Projekt als TSV

Hinweise:

* Auch der dafür notwendige Befehl ist im [Repository in Docker Hub](https://hub.docker.com/r/felixlohmeier/openrefine/)) beschrieben.

## Lösung

* Terminal 1 - Server starten: {%s%}sudo docker run --name=refine-server --rm -p 8888:3333 -v /home/stud/refine:/data felixlohmeier/openrefine:2.6rc1 -i 0.0.0.0 -m 3G -d /data{%ends%}
* Terminal 2 - Daten exportieren (1234567890123 durch Projekt-ID aus Aufgabe 2 ersetzen): {%s%}sudo docker run --link refine-server --rm -v /home/stud/refine:/data felixlohmeier/openrefine:client-py  1234567890123 -E --output=test.tsv 1234567890123{%ends%}
* Terminal 2 - Daten anzeigen: {%s%}cat test.tsv | more{%ends%}

## Aufgabe 4: Schreiben Sie ein Shell-Script, dass Server und Client startet, die Transformation durchführt und dann die Daten als TSV exportiert

Hinweise:

* Schauen Sie sich die Grundlagen für Shell-Scripte in [Kapitel 4.4](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/04_4_download_der_metadaten.html), Aufgabe 3 nochmal an.
* Shell-Scripte führen die im Script enthaltenen Befehle Zeile für Zeile einen nach dem anderen aus, sobald der vorige Befehle abgeschlossen ist. Bislang haben wir den OpenRefine-Server im interaktiven Modus gestartet, d.h. der Startbefehl kommt nie von alleine zu Ende und würde die Bearbeitung des restlichen Teils vom Script blockieren. Verwenden Sie daher im Startbefehl des Servers den Parameter ```-d``` anstelle von ```--rm```. Der Server läuft dann endlos im Hintergrund. Sie müssen ihn abschließend manuell beenden mit dem Befehl ```sudo docker stop refine-server``` und löschen mit ```sudo docker rm refine-server```
* Der Docker-Container mit dem Server muss vollständig gestartet sein, bevor Sie den Client starten können, denn sonst liefe der ins Leere. Daher sollten Sie eine gewisse Wartezeit einbauen, z.B. mit dem Befehl ```sleep 15```.
* Verwenden Sie ein neues Projekt für Ihre Tests. Wenn Sie Transformationsregeln ein zweites Mal auf ein Projekt anwenden, dann laufen die Transformationen auf den bereits transformierten Daten ab. Das führt mit Sicherheit zu unerwünschten Ergebnissen.

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
* IDs der zu verarbeitenden Projekte in der sechsten Zeile des Scripts eingeben: ```nano transform+export-minimal.sh```
* Script ausführbar machen: ```chmod +x transform+export-minimal.sh```
* Transformationsdatei 07_3.json in das Arbeitsverzeichnis laden, falls noch nicht vorhanden: ```curl https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_3.json > /home/stud/refine/07_3.json```
* Script starten mit ```./transform+export-minimal.sh```

### Variante 2: Transformations+Export-Script "Komfort"

Wie Variante 1 mit folgenden Verbesserungen:

* Die IDs der zu verarbeitenden Projekte können nun an den Befehl zum Aufruf des Scripts angehängt werden. Wenn keine Projekt-IDs angegeben werden, dann werden diejenigen Projekte verarbeitet, deren Name mit ```TRANSFORM``` beginnt. Dazu werden die vorhandenen Projekte ausgelesen und daraus die Projektnummern mit einem grep-Befehl ausgefiltert und in eine Variable geschrieben.
* Die anzuwendenden Transformationsdateien werden zu Beginn in einer Variable ```jsonfiles``` definiert (und können direkt im Script geändert werden). Das Script wendet diese Transformationsdateien in der genannten Reihenfolge auf alle zu verarbeitenden Projekte an.
* Das Script lädt selbsttätig die aktuellen Transformationsdateien aus dem Script in Gitbook, d.h. aus dem Verzeichnis https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/ in das Arbeitsverzeichnis von OpenRefine und überschreibt ggf. gleichlautende Dateien.
* Der Server wird für jedes Projekt einzeln gestartet und beendet, damit der Arbeitsspeicher nicht voll läuft.
* Statt der festen Wartezeit (sleep 15) erfolgt eine Abfrage, ob der Server erreichbar ist, bevor das Script fortschreitet. Das beschleunigt die Verarbeitung, wenn der Server schneller als in 15 Sekunden startet und beugt Fehlern vor, falls der Server ausgelastet ist und mal länger als 15 Sekunden braucht.
* Am Ende werden zur Erfolgskontrolle die exportierten TSV-Dateien ausgegeben.
* Das Script gibt die Konfigurationswerte sowie regelmäßig Start- und Endzeitpunkte aus.
* Arbeitsverzeichnis, Port und maximaler Arbeitsspeicher für den OpenRefine-Server werden zu Beginn als Variable definiert (Standard: ```/home/stud/refine/```, ```8888```, ```3G```), was eine Anpassung später leichter macht.

```
#!/bin/bash
# Script zur Transformation und zum Export von Projekten mit OpenRefine
# Variante "Komfort", Stand: 20.11.2016
#
# Voraussetzungen:
# 1. Docker
# 2. OpenRefine-Projekte im Arbeitsverzeichnis
#
# Nutzung Variante A)
# IDs der zu verarbeitenden Projekte an den Startbefehl anhängen.
# Beispiel: ./transform+export.sh 01234567890123 1234567890123
#
# Nutzung Variante B)
# Codewort TRANSFORM manuell in OpenRefine in den Namen der zu verarbeitenden Projekten aufnehmen
# und Script ohne weitere Parameter starten.
# Beispiel: ./transform+export.sh
#
# Transformationen aus den folgenden Dateien werden (in dieser Reihenfolge) durchgeführt
# (bei Bedarf direkt hier im Script ändern)
jsonfiles=(07_3.json test.json)

# Weitere Programmvariablen
workdir="/home/stud/refine"
port=8888
ram=3G

# Variablen ausgeben
echo "Transformationsdateien:   " ${jsonfiles}
echo "Arbeitsverzeichnis:       " ${workdir}
echo "OpenRefine auf Port:      " ${port}
echo "OpenRefine max. RAM:      " ${ram}
echo ""

# Startzeitpunkt ausgeben
echo "Startzeitpunkt: $(date)"
echo ""

# Transformationsdateien ins Arbeitsverzeichnis laden
echo "Transformationsdateien herunterladen..."
cd ${workdir}
for jsonfile in "${jsonfiles[@]}" ; do
    curl -O https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/${jsonfile}
done
cd - > /dev/null
echo ""

# Server starten
echo "Server starten..."
sudo docker run -d --name=refine-server -p ${port}:3333 -v ${workdir}:/data felixlohmeier/openrefine:2.6rc1 -i 0.0.0.0 -m ${ram} -d /data
echo ""

# Warten bis Server vollständig gestartet ist
until curl --silent http://localhost:${port} | cat | grep -q -o "OpenRefine" ; do sleep 3; done

# Abfrage der Projekt-IDs, wenn mit dem Startbefehl keine benannt wurden
if [ -z "$1" ]
  then
    echo "Es wurden beim Aufruf des Scripts keine Projekt-IDs benannt."
    echo ""
    echo "Projekt-IDs auslesen..."
    projects=($(sudo docker run --rm --link refine-server -v ${workdir}:/data felixlohmeier/openrefine:client-py | grep "TRANSFORM" | cut -c 2-14))
    if [ -z "$projects" ]
      then
        echo "*** Es konnten keine Projekte gefunden werden! ***"
        echo ""
        echo "Sie haben zwei Möglichkeiten Projekte zur Verarbeitung zu benennen:"
        echo "1. an den Startbefehl des Scripts die IDs der zu verarbeitenden Projekte anhängen"
        echo "Beispiel: ./transform+export.sh 01234567890123 1234567890123"
        echo ""
        echo "2. Das Codewort TRANSFORM manuell in OpenRefine in den Namen der zu verarbeitenden Projekten aufnehmen und das Script erneut starten."
        echo ""
        echo "Server beenden und Container löschen..."
        sudo docker stop refine-server
        sudo docker rm refine-server
        exit
      else
        echo "Folgende Projekte im Arbeitsverzeichnis tragen das Codewort TRANSFORM im Namen:"
        echo ${projects[@]}
        echo ""
    fi
  else
    echo "Folgende Projekt-IDs wurden beim Aufruf des Script benannt:"
    projects=($*)
    echo ${projects[@]}
    echo ""
fi

# Server beenden und Container löschen
echo "Server beenden und Container löschen..."
sudo docker stop refine-server
sudo docker rm refine-server
echo ""

# Schleife für Transformation und Export der Projekte
for projectid in "${projects[@]}" ; do

    echo "Start Projekt $projectid @ $(date)"

    # Server starten
    echo "Server starten..."
    sudo docker run -d --name=refine-server -p ${port}:3333 -v ${workdir}:/data felixlohmeier/openrefine:2.6rc1 -i 0.0.0.0 -m ${ram} -d /data

    # Warten bis Server vollständig gestartet ist
    until curl --silent http://localhost:${port} | cat | grep -q -o "OpenRefine" ; do sleep 3; done
        
    # Transformationen durchführen
    for jsonfile in "${jsonfiles[@]}" ; do
        echo "Transformiere mit ${jsonfile}..."
        sudo docker run --rm --link refine-server -v ${workdir}:/data felixlohmeier/openrefine:client-py -f ${jsonfile} ${projectid}
    done

    # Daten exportieren
    echo "Exportiere in ${projectid}.tsv"
    sudo docker run --rm --link refine-server -v ${workdir}:/data felixlohmeier/openrefine:client-py -E --output=${projectid}.tsv ${projectid}

    # Server beenden und Container löschen
    echo "Server beenden und Container löschen..."
    sudo docker stop refine-server
    sudo docker rm refine-server

    echo "Ende Projekt $projectid @ $(date)"
    echo ""
done

# Endzeitpunkt ausgeben
echo "Endzeitpunkt: $(date)"
echo ""

# Liste der exportierten Dateien
echo "Folgende Dateien wurden erfolgreich exportiert:"
echo "(Anzahl der Zeilen und Dateigröße in Bytes)"
wc -l -c ${workdir}/*.tsv

exit
```

Script als Datei: [transform+export.sh](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/scripte/transform+export.sh)

**Ausführen:**

* Script mit ```curl``` auf den Server laden: ```curl -O https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/scripte/transform+export.sh```
* Script ausführbar machen: ```chmod +x transform+export.sh```
* Script starten mit ```./transform+export.sh```

## Aufgabe 6: Führen Sie mit dem Script ALLE Transformationsschritte aus Kapitel 7 durch

Hinweise:

* Passen Sie die Zeile ```jsonfiles=(07_3.json test.json)``` so an, dass die gewünschten Transformationsdateien in der richtigen Reihenfolge abgearbeitet werden.
* Als Ausgangsbasis benötigen Sie das Ergebnis von Kapitel 7.5, Aufgabe 3. Wenn Sie damals das Backup, wie vorgeschlagen, erstellt haben, können Sie dies nun wiederherstellen.
* Da das Script bzw. der Python-Client keine Projekte erstellen kann, müssen Sie Kapitel 7.5, Aufgabe 7 manuell durchführen.

## Lösung

**Teil 1: mit Script**

* Arbeitsverzeichnis löschen (Achtung: Bei Bedarf vorher eine Kopie anlegen!): {%s%}sudo rm -r -f refine{%ends%}
* Backup aus Kapitel 7.5, Aufgabe 3 wiederherstellen: {%s%}cp -r refine-backup refine{%ends%}
* Projekte umbenennen: {%s%}Codewort TRANSFORM in alle Projektnamen schreiben{%ends%}
* Script anpassen: {%s%}nano transform+export.sh und die Zeile jsonfiles=(07_3.json test.json) durch jsonfiles=(07_3.json 07_5-6_minimal.json) ersetzen.{%ends%}
* Script ausführen (Achtung: Mehrere Stunden Laufzeit!): {%s%}./transform+export.sh{%ends%}
* TSV-Dateien mit WinSCP herunterladen: {%s%}vgl. Lösung in Kapitel 6.3, Aufgabe 1{%ends%}
* Arbeitsverzeichnis leeren: {%s%}sudo rm -r -f refine/*{%ends%}

**Teil 2: manuell**

Server Starten:
* {%s%}```sudo docker run --rm -p 8888:3333 -v /home/stud/refine:/data felixlohmeier/openrefine:2.6rc2 -i 0.0.0.0 -m 3G -d /data```{%ends%}

Projekt anlegen:
* {%s%}Create Project / Durchsuchen... / Alle TSV Dateien auswählen / Next / Configure Parsing Options{%ends%}
* {%s%}Parse data as CSV / TSV / separator-based files{%ends%}
* {%s%}Checkbox "Store file source..." deaktivieren / Projektnamen inkl. Codewort TRANSFORM vergeben und Button "Create Project" drücken{%ends%}

**Teil 3: mit Script**
* Script anpassen: {%s%}nano transform+export.sh und die Zeile jsonfiles=(07_3.json test.json) durch jsonfiles=(07_6-2.json 07_6-3.json 07_6-4.json) ersetzen.{%ends%}

## Literatur

* In der Rubrik [häufig gestellte Fragen (FAQ)]((https://github.com/OpenRefine/OpenRefine/wiki/FAQ)) der OpenRefine Dokumentation stehen auch ein paar Tipps, wie OpenRefine programmatisch als Server genutzt werden kann.