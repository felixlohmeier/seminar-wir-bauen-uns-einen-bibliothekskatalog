# 6.4 Zwischenfazit

## Zwischenstand - Wo stehen wir heute?

### a) Was haben wir bislang gemacht (Kapitel im Skript und jeweiliges Ziel)

1. Einführung in Discovery-Systeme in Bibliotheken: Einstieg ins Thema
2. Open-Source-Software für Bibliothekskataloge: Potentiale für den Einsatz von Open Source Software im Bibliothekswesen realistisch einschätzen können
3. Grundinstallation der Arbeitsumgebung: Arbeitsumgebung einrichten und sich auf der Linux Konsole zurechtfinden
4. Schnittstellen zum Laden der Metadaten: Metadaten der HAW-Bibliothek über eine Schnittstelle laden und verschiedene Metadatenformate kennenlernen
5. Exkurs zu Metadaten in Bibliotheken: Kleiner thereotischer Exkurs zu Metadatenstandards, bevor wir weiter mit den Daten arbeiten.
6. Installation von OpenRefine mit Docker: Container-Lösungen am Beispiel von Docker kennenlernen, OpenRefine installieren und Daten in ein neues Projekt in OpenRefine laden

### b) Wo stehen wir auf dem Weg zum eigenen Bibliothekskatalog?

Das haben Sie bislang erreicht:

* Sie haben einen eigenen Webserver auf einer virtuellen Maschine und wissen wie Sie auf dem Server Befehle ausführen.
* Sie haben die Metadaten der HAW-Bibliothek in 100er-Schnipseln im Format MARCXML vorliegen. Sie haben Beispieldatensätze von MARCXML gesehen.
* Sie haben OpenRefine (als Docker Container) installiert und können OpenRefine starten und aufrufen.

Bis zum eigenen Bibliothekskatalog stehen noch die folgenden Schritte an:

* Sie transformieren die Daten mit OpenRefine von MARCXML in ein Format, das leicht in einen Suchindex zu laden ist.
* Sie installieren und konfigurieren auf ihrem Webserver den Suchmaschinenindex mit Solr und laden die Daten in den Suchindex.
* Sie installieren und konfigurieren auf ihrem Webserver das Content-Management-System TYPO3 und die Erweiterung TYPO3-find.

Wenn alles fertig ist, läuft auf ihrem Webserver:

* Der Suchmaschinenindex Solr (beinhaltet die Daten)
* Das Content-Management-System TYPO3 mit der Erweiterung TYPO3-find

OpenRefine ist also nur Mittel zum Zweck, um die Daten in ein Format zu transformieren, dass Sie in den Suchindex laden können.

## Nachtrag zum Thema Virtualisierung und Docker: Wie sieht unser Systemaufbau denn jetzt eigentlich aus?

### Webserver

* Ihr Webserver ist eine virtuelle Maschine (VM) auf Ihrem Rechner mit den Leistungsdaten (CPU, Arbeitsspeicher und Festplatte), die Sie der VM in Kapitel 3.1 gewährt haben. Ihre VM teilt sich die Internetverbindung mit Ihrem Rechner.
* Stichwort "Virtualisierung": In Rechenzentren laufen solche virtuellen Maschinen, meist zusammen mit vielen anderen virtuellen Maschinen auf einem Großrechner. Die Virtualisierung ist so vollkommen, dass die virtuelle Maschine sich genau so verhält, als ob im Serverraum ein normaler PC stehen würde.
* Auf Ihrem Server ist ein Linux-Betriebssystem installiert, genauer: Debian 8.5 (auch "Debian Jessie" genannt) zzgl. der Erweiterungen die [TurnKey Core](https://www.turnkeylinux.org/core) mitbringt.
* Um weitere Programme (OpenRefine, später auch der Suchmaschinenindex Solr, TYPO3 und TYPO3-find) leichter installieren und starten zu können, haben wir zunächst Docker auf dem Linux-Betriebssystem installiert.
* OpenRefine starten wir (bei Bedarf!) mit Hilfe von Docker als Container. Durch die Befehle, die wir Docker beim Aufruf mitgeben, machen wir OpenRefine im Netzwerk unter dem Port 8888 verfügbar und definieren als Arbeitsverzeichnis ihr persönliches Verzeichnis auf dem Server (/home/stud/).

### Arbeitsplatzrechner:

* Von ihrem Rechner oder einem anderen Rechner in Ihrem Netzwerk können Sie auf den Webserver zugreifen:
* mit Putty über das SSH-Protokoll auf die Kommandozeile des Linux-Betriebssystems (Debian 8.5) ihres Webservers . Damit haben Sie die gleichen Möglichkeiten, als wenn Sie an den Server einen Bildschirm, eine Maus und eine Tastatur anschließen würden.
* mit WinSCP über das SCP-Protokoll auf die Dateien ihres Webservers. Sie können damit Dateien herunterladen oder hochladen.
* mit einem Browser (Firefox, Chrome, usw.) auf OpenRefine unter der Adresse http://<IP-Adresse>:8888 (Beispiel: http://192.168.1.1:8888), später auf Solr (http://192.168.1.1:8983), TYPO3 (http://192.168.1.1/typo3) und den Bibliothekskatalog 192.168.1.1 (also ganz ohne Port).
