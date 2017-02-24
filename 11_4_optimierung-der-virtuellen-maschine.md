# 11.4 Optimierung der virtuellen Maschine

Sie sind jetzt im Bonuslevel angekommen, herzlichen Glückwunsch!

Wenn Sie die virtuelle Maschine noch weiter verwenden möchten, dann empfiehlt es sich noch ein paar Anpassungen an der Installation vorzunehmen.

## Automatischer Start der Docker-Container

### solr.service

```sudo nano /etc/systemd/system/solr.service```

Im Editor folgenden Text eingeben und Datei speichern:

```
[Unit]
Description=Solr fuer Katalog
Requires=docker.service
After=docker.service

[Service]
ExecStart=/usr/bin/docker start -a my_solr
ExecStop=/usr/bin/docker stop my_solr

[Install]
WantedBy=default.target
```

### typo3-db.service

```sudo nano /etc/systemd/system/typo3-db.service```

Im Editor folgenden Text eingeben und Datei speichern:

```
[Unit]
Description=Maria-DB für Katalog
Requires=docker.service
After=docker.service

[Service]
ExecStart=/usr/bin/docker start -a typo3-db
ExecStop=/usr/bin/docker stop typo3-db

[Install]
WantedBy=default.target
```

### katalog.service

```sudo nano /etc/systemd/system/katalog.service```

Im Editor folgenden Text eingeben und Datei speichern:

```
[Unit]
Description=TYPO3 für Katalog
Requires=docker.service solr.service typo3-db.service
After=docker.service solr.service typo3-db.service

[Service]
ExecStart=/usr/bin/docker start -a typo3-web
ExecStop=/usr/bin/docker stop typo3-web
ExecStopPost=/usr/bin/docker stop -t 5 typo3-db
ExecStopPost=/usr/bin/docker stop -t 5 my_solr

[Install]
WantedBy=default.target
```

### openrefine.service

```sudo nano /etc/systemd/system/openrefine.service```

Im Editor folgenden Text eingeben und Datei speichern:

```
[Unit]
Description=OpenRefine
Requires=docker.service
After=docker.service

[Service]
ExecStart=/usr/bin/docker run --name=refine-server -p 8888:3333 -v /home/stud/refine:/data felixlohmeier/openrefine:dev -i 0.0.0.0 -m 1G -d /data"
ExecStop=/usr/bin/docker stop -t 50 refine-server
ExecStopPost=/usr/bin/docker rm -f refine-server

[Install]
WantedBy=default.target
```

### Services aktivieren


```
sudo systemctl daemon-reload
sudo systemctl enable solr.service
sudo systemctl enable typo3-db.service
sudo systemctl enable katalog.service
sudo systemctl enable openrefine.service
```

## Anpassung Willkommensbildschirm von Turnkey

### confconsole.conf

```sudo nano /etc/confconsole/confconsole.conf```

Im Editor das Zeichen ```#``` vor ```default_nic``` in Zeile 2 entfernen und Datei speichern.

### services.txt

```sudo nano /etc/confconsole/services.txt```

Im Editor folgenden Text ergänzen und Datei speichern:

```
Katalog:    http://$ipaddr
TYPO3:      http://$ipaddr/typo3
Solr:       http://$ipaddr:8983
OpenRefine: http://$ipaddr:8888
```

## Anpassung Willkommensnachricht beim Login

```sudo nano /etc/update-motd.d/90-footer```

Im Editor folgenden Text eingeben und Datei speichern:

```
#!/bin/sh
echo "*** Status der Docker-Container ***"
docker ps -a
echo ""
echo "*** Befehl für stop/start des Katalogs (docker typo3-web, typo3-db und my_solr) ***"
echo "sudo systemctl stop katalog"
echo "sudo systemctl start katalog"
echo ""
echo "*** Befehl für stop/start von OpenRefine (docker refine-server) ***"
echo "sudo systemctl stop openrefine"
echo "sudo systemctl start openrefine"
echo ""
phymem=$(free -m|awk '/^Mem:/{print $2}')
if [ $phymem -lt 2000 ]; then
echo "Achtung: Für die Arbeit mit OpenRefine werden 2000MB Arbeitsspeicher benötigt. Es stehen aber nur ${phymem}MB zur Verfügung. Bitte weisen Sie der virtuellen Maschine mehr Arbeitsspeicher zu, wenn Sie OpenRefine verwenden wollen."
echo ""
fi
```

Anschließend folgenden Befehl ausführen:

```sudo chmod +x /etc/update-motd.d/90-footer```

## Achtung: Arbeitsspeicher und OpenRefine

Wenn Sie der virtuellen Maschine mehr als 2GB Arbeitsspeicher zuweisen können, dann können Sie den Speicher für OpenRefine erhöhen.

Beispiel für 4GB Arbeitsspeicher der VM:

* ```sudo nano /etc/systemd/system/openrefine.service```
* Im Editor in der Zeile ```ExecStart=``` das ```-m 1G``` durch ```-m 3G``` ersetzen

## Neustart

Die Änderungen werden bei einem Neustart der virtuellen Maschine wirksam

```sudo shutdown -r now```
