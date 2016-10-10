# 3.3 Verbinden mit dem Server über SSH

## Schritt 1: Verbinden
### mit Windows
Verbinden mit dem Server über SSH-Protokoll mit der kleinen Software Putty:
* putty.exe von http://www.putty.org herunterladen und ausführen
* in das Feld "Host name" Benutzername@IP-Adresse eintragen (Beispiel: ```felix@192.168.1.1```)
* SSH-Verbindung starten
* Kopieren und einfügen funktioniert bei Putty etwas anders als gewohnt. Das Einfügen aus der Zwischenablage erfolgt über einen einfachen *Rechtsklick*, es gibt kein Kontextmenü wie sonst unter Windows. Siehe dazu auch: https://kb.site5.com/shell-access-ssh/putty/putty-how-to-copy-and-paste-to-and-from-a-putty-window/

### mit Linux
* Terminal aufrufen
* ssh *user*@*ip* (Beispiel: ```ssh felix@192.168.1.1```)

### mit Mac OS X
...

## Schritt 2: Neues Passwort setzen
1. Sicheres Passwort unter http://passwordsgenerator.net/ generieren (Empfehlung: Checkbox "Exclude Ambiguous Characters" aktivieren, das macht es leichter das Passwort einzutippen)
2. Passwort setzen mit dem Befehl ```passwd```