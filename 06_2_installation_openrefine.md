# 6.2 Installation OpenRefine

## Container aus Docker Hub laden

Docker bietet eine zentrale Plattform an, auf der Container zur Nachnutzung abgelegt weden können (vergleichbar mit einem App-Store). Wir nutzen das folgende Repository auf Docker Hub:
https://hub.docker.com/r/felixlohmeier/openrefine/

## Laden und Starten von OpenRefine

Einer der Vorteile von Docker ist, dass mit einem einzigen Befehl der Download und das Starten von Containern aus dem Docker Hub ermöglicht wird:

```
sudo docker run --rm -p 8888:3333 felixlohmeier/openrefine:2.6rc1
```

Anschließend im Browser (z.B. Firefox) auf dem lokalen Rechner OpenRefine aufrufen. OpenRefine ist unter der IP-Adresse des Webservers, gefolgt von Port 8888 erreichbar (Beispiel: https://192.168.1.1:8888).

Erläuterungen:
* Da der Container noch nicht lokal vorliegt, wird er automatisch von Docker Hub heruntergeladen (in Teilbestandteilen)
* ```felixlohmeier/openrefine:2.6rc2``` ist die Kennzeichnung des Images im Docker Hub
* ```--rm``` löscht den Container nach dem Beenden wieder, damit die Festplatte nicht zumüllt
* ```-p 8888:3333``` richtet ein sogenanntes Port Forwarding im Netzwerk ein. Port 8888 außen wird auf Port 3333 innen gemappt. Somit ist der Docker-Container über http://<ip-adresse>:8888 von außen erreichbar
* Bei dieser Variante werden Daten innerhalb des Containers gespeichert. Da wir das Kommando ```--rm``` verwenden, werden die Daten nach Beenden ebenfalls gelöscht.
* Beenden von Docker im Terminal mit ```STRG+C```

## Laden und Starten von OpenRefine mit lokalem Arbeitsverzeichnis

1. Ordner im Homeverzeichnis erstellen:
```mkdir refine```

2. Docker starten mit zusätzlichen Parametern:
```
sudo docker run --rm -p 8888:3333 -v /home/stud/refine:/data felixlohmeier/openrefine:2.6rc1 -i 0.0.0.0 -m 3G -d /data
```

Erläuterungen:
* ```-v /home/stud/refine:/data``` definiert das lokale Arbeitsverzeichnis.
* ```stud``` durch eigenen Benutzernamen ersetzen
* ```-i 0.0.0.0``` öffnet den Docker-Container für den Zugriff aus dem Netzwerk
* ```-m 3G``` erlaubt dem Docker-Container bis zu 3 GB Arbeitsspeicher zu verwenden
* ```-d /data``` definiert das Arbeitsterzeichnis im Docker-Container