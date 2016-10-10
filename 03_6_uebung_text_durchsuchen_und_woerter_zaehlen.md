# 3.6 Übung: Text durchsuchen und Wörter zählen

## Schritt 1: "War and Peace" von Leo Tolstoy herunterladen
* ```curl http://www.gutenberg.org/files/2600/2600-0.txt > war_and_peace.txt```

## Schritt 2: Zeilen, Wörter und Zeichen zählen mit wc
* ```wc war_and_peace.txt```

## Schritt 3: Suche nach Vorkommnissen der Wörter "war" and "peace"
* ```cat war_and_peace.txt | grep -i -ow war | wc```
* ```cat war_and_peace.txt | grep -i -ow peace | wc```

## Siehe auch
Ausführlichere Übung im Blog des Projekts Librecat/Catmandu:
https://librecatproject.wordpress.com/2014/12/04/day-4-grep-less-and-wc/

Bitte beachten: Die dort referenzierte Textdatei ist anders strukturiert als die obige *war_and_peace.txt* und liefert daher andere Zählergebnisse.