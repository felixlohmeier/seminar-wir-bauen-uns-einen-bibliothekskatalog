#!/bin/bash
# Script zur Transformation und zum Export von Projekten mit OpenRefine
# Variante "Komfort", Stand: 06.01.2017
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
# Codewort manuell in OpenRefine in den Namen der zu verarbeitenden Projekten aufnehmen
# und Script ohne weitere Parameter starten.
# Beispiel: ./transform+export.sh
#
# Transformationen aus den folgenden Dateien werden (in dieser Reihenfolge) durchgeführt
# (bei Bedarf direkt hier im Script ändern)
jsonfiles=(07_3.json 07_5_minimal.json)

# Weitere Programmvariablen
codewort="TRANSFORM"
workdir="/home/stud/refine"
port=8888
ram=3G

# Variablen ausgeben
echo "Transformationsdateien:   " ${jsonfiles[@]}
echo "Arbeitsverzeichnis:       " ${workdir}
echo "OpenRefine auf Port:      " ${port}
echo "OpenRefine max. RAM:      " ${ram}
echo "Codewort:                 " ${codewort}
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
    projects=($(sudo docker run --rm --link refine-server -v ${workdir}:/data felixlohmeier/openrefine:client-py | grep "${codewort}" | cut -c 2-14))
    if [ -z "$projects" ]
      then
        echo "*** Es konnten keine Projekte gefunden werden! ***"
        echo ""
        echo "Sie haben zwei Möglichkeiten Projekte zur Verarbeitung zu benennen:"
        echo "1. an den Startbefehl des Scripts die IDs der zu verarbeitenden Projekte anhängen"
        echo "Beispiel: ./transform+export.sh 01234567890123 1234567890123"
        echo ""
        echo "2. Das Codewort ${codewort} manuell in OpenRefine in den Namen der zu verarbeitenden Projekten aufnehmen und das Script erneut starten."
        echo ""
        echo "Server beenden und Container löschen..."
        sudo docker stop refine-server
        sudo docker rm refine-server
        exit
      else
        echo "Folgende Projekte im Arbeitsverzeichnis tragen das Codewort ${codewort} im Namen:"
        echo ${projects[@]}
        echo ""
    fi
  else
    echo "Folgende Projekt-IDs wurden beim Aufruf des Scripts benannt:"
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
        # Neustart des Docker-Containers nach jeder Transformation, um Arbeitsspeicher zu schonen
        echo "Server neu starten ..." 
        docker stop -t=500 ${dockername}
        docker rm ${dockername}
        sudo docker run -d --name=refine-server -p ${port}:3333 -v ${workdir}:/data felixlohmeier/openrefine:2.6rc1 -i 0.0.0.0 -m ${ram} -d /data
        until curl --silent http://localhost:${port} | cat | grep -q -o "OpenRefine" ; do sleep 3; done
    done

    # Daten exportieren
    echo "Exportiere in ${projectid}.tsv"
    sudo docker run --rm --link refine-server -v ${workdir}:/data felixlohmeier/openrefine:client-py -E --output=${projectid}.tsv ${projectid}

    # Server beenden und Container löschen
    echo "Server beenden und Container löschen..."
    sudo docker stop -t=500 refine-server
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
