# 3.3 Verbinden mit dem Server über SSH

## Schritt 1: Verbinden
### mit Windows
Verbinden mit dem Server über SSH-Protokoll mit der kleinen Software Putty:
* putty.exe von http://www.putty.org herunterladen und ausführen
* SSH-Verbindung starten

### mit Linux
* Terminal aufrufen
* ssh *user*@*ip* (Beispiel: ```ssh felix@192.168.1.1```)

### mit Mac OS X
...

## Schritt 2: Neues Passwort setzen
1. Sicheres Passwort unter http://passwordsgenerator.net/ generieren (Empfehlung: Checkbox "Exclude Ambiguous Characters" aktivieren, das macht es leichter das Passwort einzutippen)
2. Passwort setzen mit dem Befehl ```passwd```