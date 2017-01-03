# 6.1 Installation Docker

## Container-Lösungen am Beispiel von Docker

Unterschied zwischen Virtualisierung (beispielsweise mit Virtualbox, vgl. Kapitel 3.1) und Container-Lösungen (wie z.B. Docker)

[![Vergleich von docker.com](images/screenshot-docker-comparison.png)](https://www.docker.com/what-docker)

Beides lässt sich kombinieren: Wir installieren Docker innerhalb der virtuellen Maschine (VM).

Literatur:
* Docker und mehr: Was zur Hölle sind eigentlich Container? http://t3n.de/news/was-sind-container-756373
* Alternativen zu Docker: http://www.linux-magazin.de/Ausgaben/2015/05/LXD

## Installation von Docker auf der VM

Für die Installation von Docker auf der in Kapitel 3.1 eingerichteten VM kann der normalen Installationsanleitung für Debian Server gefolgt werden (vgl. https://docs.docker.com/engine/installation/linux/debian/)

Hier eine Minimalvariante:

1. Befehl ```sudo nano /etc/apt/sources.list.d/docker.list``` eingeben, folgenden Text einfügen ```deb http://apt.dockerproject.org/repo debian-jessie main``` und Datei mit ```STRG+X``` und ```Y``` speichern.

2. Anschließend folgende Befehle in dieser Reihenfolge ausführen:

```
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-get update
sudo apt-get install docker-engine
sudo service docker start
```

## Test

Der Befehl ```sudo docker run hello-world``` sollte eine Nachricht *"Hello from Docker!"* mit weiteren Erläuterungen ausgeben.