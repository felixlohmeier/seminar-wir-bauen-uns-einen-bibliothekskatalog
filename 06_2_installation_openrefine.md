# 6.2 Installation OpenRefine

## Container aus Docker Hub laden

Docker bietet eine zentrale Plattform an, auf der Container zur Nachnutzung abgelegt weden können (vergleichbar mit einem App-Store). Wir nutzen das folgende Repository auf Docker Hub:
https://hub.docker.com/r/felixlohmeier/openrefine/

## Laden und Starten von OpenRefine (mit lokalem Arbeitsverzeichnis)

### Schritt 1: Ordner für OpenRefine im Homeverzeichnis erstellen:

* ```cd ~```
* ```mkdir refine```

### Schritt 2: Container mit OpenRefine herunterladen und starten

Einer der Vorteile von Docker ist, dass mit einem einzigen Befehl der Download und das Starten von Containern aus dem Docker Hub ermöglicht wird:

```
sudo docker run --rm -p 8888:3333 -v /home/stud/refine:/data felixlohmeier/openrefine:2.6rc2 -i 0.0.0.0 -m 3G -d /data
```

Erläuterungen:

* Da der Container noch nicht lokal vorliegt, wird er automatisch von Docker Hub heruntergeladen (in Teilbestandteilen)
* ```felixlohmeier/openrefine:2.6rc2``` ist die Kennzeichnung des Images im Docker Hub
* ```--rm``` löscht den Container nach dem Beenden wieder, damit die Festplatte nicht zumüllt
* ```-p 8888:3333``` richtet ein sogenanntes Port Forwarding im Netzwerk ein. Port 8888 außen wird auf Port 3333 innen gemappt. Somit ist der Docker-Container über http://<ip-adresse>:8888 von außen erreichbar
* ```-v /home/stud/refine:/data``` definiert das oben erstellte Arbeitsverzeichnis und verbindet es mit dem internen Arbeitsverzeichnis /data im Container
* ```-i 0.0.0.0``` öffnet den Docker-Container für den Zugriff aus dem Netzwerk
* ```-m 3G``` erlaubt OpenRefine bis zu 3 GB Arbeitsspeicher zu verwenden
* ```-d /data``` definiert das interne Arbeitsverzeichnis von OpenRefine

**Achtung:**

Den Parameter ```-m 3G``` in diesem Befehl müssen Sie an den verfügbaren Arbeitsspeicher auf ihrer virtuellen Maschine anpassen.

* Freien Arbeitsspeicher mit ```free -m``` anzeigen und Wert in Zeile "-/+ buffers/cache" in Spalte "free" notieren.
* Zahl bei -m 3G im Startbefehl anpassen. Beispiel für 1 GB freien Arbeitsspeicher:

```
sudo docker run --rm -p 8888:3333 -v /home/stud/refine:/data felixlohmeier/openrefine:2.6rc2 -i 0.0.0.0 -m 1G -d /data
```

### Schritt 3: OpenRefine im Browser aufrufen

OpenRefine ist unter der IP-Adresse des Webservers, gefolgt von Port 8888 erreichbar (Beispiel: http://192.168.1.1:8888).

### Schritt 4: Container beenden und neu starten

OpenRefine ist nur solange verfügbar, wie der oben verwendete Befehl in der Kommandozeile läuft.

1. Beenden Sie OpenRefine mit ```STRG``` und ```C``` auf der Kommandozeile.
2. Prüfen Sie, ob OpenRefine jetzt noch im Browser (Beispiel: http://192.168.1.1:8888) erreichbar ist. Es sollte eine Fehlermeldung des Browsers erscheinen.
3. Starten Sie OpenRefine erneut, indem Sie auf der Kommandozeile mit der ```Pfeiltaste nach oben``` den vorigen Befehl auswählen und mit ```Enter``` ausführen.
4. Prüfen Sie, ob OpenRefine jetzt wieder verfügbar ist.

Auf der Kommandozeile können Sie übrigens mitverfolgen, wie der Browser und OpenRefine miteinander kommunizieren. Beim Aufruf von OpenRefine im Browser erscheinen beispielsweise die folgenden POST und GET Befehle in der Kommandozeile:

```
15:10:34.819 [                   refine] POST /command/core/load-language (19332ms)
15:10:34.940 [                   refine] POST /command/core/load-language (121ms)
15:10:35.223 [                   refine] POST /command/core/get-importing-configuration (283ms)
15:10:35.509 [                   refine] GET /command/core/get-all-project-metadata (286ms)
15:10:35.632 [                   refine] GET /command/core/get-languages (123ms)
15:10:35.721 [                   refine] GET /command/core/get-version (89ms)
```

Doch dazu später mehr.