# 9.2 Erstkonfiguration von TYPO3

Nach dem Start der Docker-Container erreichen Sie TYPO3 unter der Adresse http://localhost (localhost wie üblich durch IP-Adresse ersetzen). Dort treffen Sie zunächst auf den Installationsassistenten.

## Aufgabe 1: Installationsassistent durchführen und Startpaket installieren

Hinweise:

* In Schritt 2 muss im Feld ```host``` der Name des Docker-Containers mit der Datenbank angegeben werden, also ```typo3-db```. Die Passwörter entsprechen den Passwörtern aus dem Startbefehl für die Datenbank. Falls Sie nichts verändert haben wäre der MYSQL-Nutzername ```typo3``` und das Passwort ```yourothersupersecretpassword```
* Wählen Sie in Schritt 5 die Option ```Yes, download the list of distributions.``` und installieren Sie nach dem Login das Paket ```The official Introduction Package```
