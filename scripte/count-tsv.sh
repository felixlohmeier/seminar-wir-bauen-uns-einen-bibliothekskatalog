#!/bin/bash
# Script zur Zählung von belegten Werten in TSV-Dateien
# Stand: 20.11.2016
# Nutzung: ./count.sh file.tsv

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
