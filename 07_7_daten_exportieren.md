# 7.7 Daten exportieren

OpenRefine bietet viele Möglichkeiten die Daten in verschiedene Formate zu exportieren. Wie eingangs beschrieben, wollen wir das Format TSV nutzen, das sehr einfach ist und sich später gut in den Suchindex spielen lässt.

Hinweise:

* Der Klick auf den Menüpunkt Export / TSV startet sofort einen Download der Daten. Das reicht in den meisten Fällen aus. Probieren Sie aber auch die anderen Möglichkeiten aus.
* Wenn Sie die Daten exportiert haben, können Sie folgende Befehle zur Überprüfung der Daten verwenden: ```wc -l -c``` und ```head -n1```

## Lösung

* Export: {%s%}Projekte nacheinander in OpenRefine laden und im Menü oben rechts Export / "Tab separated value" wählen. Der Download sollte automatisch beginnen. Speichern Sie die Daten lokal in einem beliebigen Verzeichnis.{%ends%}
* Zählung der Zeilen der TSV-Dateien (sollte der Anzahl der Records minus 1 entsprechen): ```wc -l -c *.tsv```
* Erste Zeile der TSV-Dateien anzeigen (sollte die Spaltenüberschriften beinhalten): ```head -n1 *.tsv```

## Literatur

* [Exporter in der OpenRefine Dokumentation](https://github.com/OpenRefine/OpenRefine/wiki/Exporters)