#!/bin/bash
# Script zum Download von Metadaten über Z39.50-Schnittstellen mit curl

# Programmvariablen
name=haw
date=$(date +%F)
dir=download
url=http://sru.gbv.de/opac-de-18-302?operation=searchRetrieve
query="pica.ppn=.*"
recordSchema=marcxml
startRecord=1
maximumRecords=100
endRecord=450200
let counter=startRecord+maximumRecords-1

# Variablen ausgeben
echo "Dateinamen:	" ${name}_${date}_$(printf "%.6i\n" ${startRecord})-$(printf "%.6i\n" ${counter}).marcxml
echo "Verzeichnis	" ${dir}
echo "Schnittstelle:	" ${url}
echo "Suchabfrage:	" ${query}
echo "Records:	" "von "${startRecord}" bis "${endRecord} 
echo "pro Datei:	" ${maximumRecords}
echo ""

# Startzeitpunkt ausgeben
echo "Startzeitpunkt: $(date)"
echo ""

# Verzeichnis erstellen (falls nicht vorhanden)
mkdir download > /dev/null 2>&1

# Schleife mit Aufruf von curl
while [ "$counter" -le "$endRecord" ] ; do
echo "Download Records "${startRecord}" bis "${counter}"..."
curl "${url}&query=${query}&maximumRecords=${maximumRecords}&recordSchema=${recordSchema}&startRecord=${startRecord}" > $dir/${name}_${date}_$(printf "%.6i\n" ${startRecord})-$(printf "%.6i\n" ${counter}).marcxml
echo "Ergebnis: "$(grep -c -H "<controlfield tag=\"001\">" $dir/${name}_${date}_$(printf "%.6i\n" ${startRecord})-$(printf "%.6i\n" ${counter}).marcxml)" Records"
echo ""
let counter=counter+maximumRecords
let startRecord=startRecord+maximumRecords
done

# Endzeitpunkt ausgeben
echo "Endzeitpunkt: $(date)"
echo ""

# Liste der erstellten Dateien
echo "Folgende Dateien liegen jetzt vor:"
echo "(Dateinamen und Anzahl der enthaltenen Records)"
grep -c "<controlfield tag=\"001\">" $dir/*.marcxml
echo ""

# Gesamtzahl der heruntergeladenen Records
echo "Gesamtanzahl der Records im Ordner download:"
grep "<controlfield tag=\"001\">" $dir/*.marcxml | wc -l

exit
