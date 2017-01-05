#!/bin/bash
# Script zur Zählung von belegten Werten in TSV-Dateien
# Stand: 05.01.2017
# Nutzung: ./count-tsv.sh file.tsv

# Abfrage der Dateinamen
if [ -z "$1" ]
  then
    echo "Bitte Dateinamen angeben!"
    echo "Beispiel: ./count-tsv.sh file.tsv"
    exit
  else
    files=($*)
    printf '%s\t%s\t%s\n' MARC-Feld Vorkommen Mehrfachbelegung
fi

# Schleife für mehrere Dateien
for file in "${files[@]}"; do

	# Spaltennamen erfassen
	readarray -t columns < <(head -q -n1 ${file} | tr '\t' '\n' | cat)

	# Belegte Zellen in Spalten zählen und ausgeben
	number=1
	for column in "${columns[@]}"; do
	printf '%s\t%s\t%s\n' "${column}" $(cut -d$'\t' -f ${number} ${file} | grep -v '^$' | wc -l) $(cut -d$'\t' -f ${number} ${file} | grep '␟' | wc -l)
	number=$(($number+1))
	done
done
