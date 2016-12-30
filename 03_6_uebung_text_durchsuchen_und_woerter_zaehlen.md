# 3.6 Übung: Text durchsuchen und Wörter zählen

## Schritt 1: "War and Peace" von Leo Tolstoy herunterladen und anzeigen
* ```curl http://www.gutenberg.org/files/2600/2600-0.txt > war_and_peace.txt```
* ```cat war_and_peace.txt | less```

Der Anhang ```| less``` am zweiten Befehl zeigt den Text so an, dass Sie mit den Pfeiltasten scrollen können. Beenden können Sie die Ansicht mit der Taste ```q```.

## Schritt 2: Zeilen, Wörter und Zeichen zählen mit wc
* ```wc war_and_peace.txt```

Die drei Nummern sind Zeilen, Wörter und Zeichen (in dieser Reihenfolge).

## Schritt 3: Suche nach Vorkommnissen der Wörter "war" and "peace"
* ```cat war_and_peace.txt | grep -i -ow war | wc```
* ```cat war_and_peace.txt | grep -i -ow peace | wc```

## Siehe auch
1. Ausführlichere Übung im Blog des Projekts Librecat/Catmandu: https://librecatproject.wordpress.com/2014/12/04/day-4-grep-less-and-wc/. Dabei bitte beachten: Die dort referenzierte Textdatei ist anders strukturiert als die obige *war_and_peace.txt* und liefert daher andere Zählergebnisse.
2. Dreistündiger Einführungskurs "Shell Lessons for Librarians" im Projekt "Library Carpentry" http://data-lessons.github.io/library-shell/