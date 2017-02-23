# 9.1 Installation von TYPO3 mit Docker

Wir installieren TYPO3 mit den von Martin Helmich vorbereiteten Docker-Containern:

* Webseite mit Erläuterungen: https://www.martin-helmich.de/de/blog/typo3-cms-docker.html
* Container im Docker Hub: https://hub.docker.com/r/martinhelmich/typo3/

## Aufgabe 1: TYPO3 installieren

Hinweise:

* Der Docker-Container mit Solr aus Kapitel 8 muss laufen. Falls zwischenzeitlich beendet, mit folgendem Befehl starten: ```sudo docker start my_solr```
* Folgen Sie der oben verlinkten Anleitung von Martin Helmich. Abweichend davon müssen Sie jedoch einen Link zum Container mit dem Solr-Index einrichten, da wir später von TYPO3 aus darauf zugreifen müssen. Ergänzen Sie im Startbefehl für den Container typo3-web den Parameter ```--link my_solr```

## Lösung

### Schritt 1: Solr starten (bei Bedarf)

{%s%}sudo docker start my_solr{%ends%}

### Schritt 2: Container typo3-db für Datenbank starten (hier mit mariadb):

```
sudo docker run -d --name typo3-db \
    -e MYSQL_ROOT_PASSWORD=yoursupersecretpassword \
    -e MYSQL_USER=typo3 \
    -e MYSQL_PASSWORD=yourothersupersecretpassword \
    -e MYSQL_DATABASE=typo3 \
    mariadb:latest \
    --character-set-server=utf8 \
    --collation-server=utf8_unicode_ci
```

### Schritt 3: Container typo3-web für die Weboberfläche von TYPO3 starten

```
sudo docker run -d --name typo3-web \
    --link typo3-db:db \
    --link my_solr \
    -p 80:80 \
    martinhelmich/typo3:7
```

### Befehle zum Stopp und Start von TYPO3

* TYPO3 stoppen: ```sudo docker stop typo3-web && sudo docker stop typo3-db```
* TYPO3 starten: ```sudo docker start typo3-db && sudo docker start typo3-web```
