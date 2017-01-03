# 6.3 OpenRefine starten und Daten laden

## Aufgabe 1: Beispieldaten vom Webserver auf den lokalen Rechner laden

Die einfachste Möglichkeit, um Daten in OpenRefine zu laden, ist das Hochladen von Daten vom lokalen Rechner. Dazu müssen wir zunächst die Daten vom Webserver auf den lokalen Rechner übertragen. Laden Sie ein SCP-Programm (z.B. [WinSCP Portable](https://winscp.net/eng/download.php) für Windows) und übertragen Sie zehn MARCXML-Dateien vom Server auf ihren lokalen Rechner.

## Lösung Variante 1: mit WinSCP (Windows)

1. Download WinSCP Portable: {%s%}Datei https://winscp.net/download/WinSCP-5.9.2-Portable.zip herunterladen, das ZIP-Archiv öffnen und in einem beliebigen Verzeichnis (z.B. Desktop) entpacken. Anschließend die Datei WinSCP.exe starten.{%ends%}
2. Mit dem Server verbinden: {%s%}Protokoll SCP auswählen, in das Feld "Host name" die IP-Adresse eingeben, Benutzername und Passwort eingeben und Login anklicken.{%ends%}
3. Dateien übertragen: {%s%}Links das gewünschte Arbeitsverzeichnis (z.B. Desktop) auswählen, 10 MARCXML-Dateien per Drag & Drop von rechts nach Links schieben.{%ends%}

## Lösung Variante 2: mit SCP (Mac und Linux)

1. Auf Mac OS X und Linux ist ein Programm ```scp``` für die Kommandozeile in der Regel vorinstalliert.
2. Öffnen Sie ein [Terminal](http://www.maclife.de/tipps-tricks/software/os-x-das-terminal-fuer-einsteiger) auf ihrem Betriebssystem (nicht in der virtuellen Maschine)
3. Wechseln Sie in das Verzeichnis, in das Sie die Daten herunterladen wollen. Beispiel: ```cd ~/Downloads```
4. Download aller Dateien im Ordner ```download``` von der virtuellen Maschine:

```
scp stud@192.168.1.1:download/* .
```

## Aufgabe 2: Daten konfigurieren und in ein neues Projekt laden

Starten Sie OpenRefine, laden Sie eine MARCXML-Datei in OpenRefine und legen Sie damit ein neues Projekt an.

Hinweise:

* Wählen Sie die Option "XML-Files". Die Option "MARC" ist nicht für XML gedacht und [funktioniert derzeit ohnehin nicht](https://github.com/OpenRefine/OpenRefine/issues/794).

## Lösung

* OpenRefine auf dem Webserver starten: {%s%}sudo docker run --rm -p 8888:3333 -v /home/stud/refine:/data felixlohmeier/openrefine:2.6rc2 -i 0.0.0.0 -m 3G -d /data{%ends%}
* OpenRefine aufrufen: {%s%}Auf dem lokalen Rechner im Browser (z.B. Firefox) die IP-Adresse des Webservers gefolgt mit Port 8888 aufrufen. Beispiel: https://192.168.1.1:8888{%ends%}
* Projekt erstellen: {%s%}Auf den Button "Durchsuchen" klicken und eine der in Aufgabe 1 heruntergeladenen Dateien auswählen. Im nächsten Bildschirm unten links bei Parse data as "XML files" auswählen, dann im Vorschaubildschirm auf den Pfad record xmlns="http://www.loc.gov/MARC21/slim" klicken und dann oben rechts den Button "Create Project" drücken.{%ends%}
