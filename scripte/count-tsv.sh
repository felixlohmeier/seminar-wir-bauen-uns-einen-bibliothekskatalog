#!/bin/bash
# Script zur Zählung von belegten Werten in TSV-Dateien
# Stand: 20.11.2016
# Nutzung: ./count-tsv.sh file.tsv

# Abfrage der Dateinamen
if [ -z "$1" ]
  then
    echo "Bitte Dateinamen angeben!"
    echo "Beispiel: ./count-tsv.sh file.tsv"
    exit
  else
    echo "Folgende Dateien werden untersucht:"
    files=($*)
    printf '%s\n' "${files[@]}"
fi

# Schleife für mehrere Dateien
for file in "${files[@]}"; do

	echo ""
	echo $file
	echo ""
	printf '%-30s\t%-10s\t%-10s \n' "SPALTENNAME" "ZEILEN" "ZEILEN-MIT-␟"
	
	# Spaltennamen erfassen
	readarray columns < <(head -q -n1 ${file} | tr '\t' '\n' | cat)

	# Belegte Zellen in Spalten zählen und ausgeben
	number=1
	for column in "${columns[@]}"; do
	printf '%-30s\t%-10d\t%-10d \n' ${column} $(cut -d$'\t' -f ${number} ${file} | grep -v '^$' | wc -l) $(cut -d$'\t' -f ${number} ${file} | grep '␟' | wc -l)
	number=$(($number+1))
	done
done
