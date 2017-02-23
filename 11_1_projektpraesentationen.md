# 11.1 Projektpräsentationen

Neben den Referaten und den Lerntagebüchern gab es für die Studierenden auch die Möglichkeit in Projekten weiter mit der Technik zu experimentieren und ihre Erkenntnisse in der abschließenden Sitzung zu präsentieren. Folgende Projektaufgaben wurden vergeben:

1. VuFind als Beispiel für eine integrierte Lösung (Datenprozessierung und Katalog)
2. Zusätzliche Daten mit OpenRefine bearbeiten und in den Katalog spielen
3. Anpassungen an der Katalogoberfläche mit TYPO3/TYPO3-find (Design & funktional)

## Präsentation zu VuFind

Maria von Loh und Ines Rettmer haben sich mit der Komplettlösung [VuFind](https://vufind.org/vufind/) beschäftigt, die an vielen Bibliotheken in Deutschland im Einsatz ist und seit 10 Jahren als Open-Source-Projekt stetig weiterentwickelt wird.

Erkenntnisse:

* Eine native Installation von VuFind unter Windows ist schwierig. Eine Testinstallation unter Windows fällt leicher mit VirtualBox, also der Installation von VuFind mit Linux in einer virtuellen Maschine (vgl. Kapitel 3.1).
* Der erste Start dauert etwa 15 Minuten und dann empfangen einen zunächst viele rote Balken mit Fehlermeldungen. Die Installationsanleitung gibt an dieser Stelle vor, den "Reparieren-Knopf" zu drücken und dann funktioniert in der Regel auch alles. Also nicht von den Fehlermeldungen abschrecken lassen.
* VuFind mag Daten am liebsten im Format MARC21 in der Kodierung UTF-8. Testdaten können bei der Deutschen Nationalbibliothek heruntergeladen werden: http://datendienst.dnb.de/cgi-bin/mabit.pl?userID=testdat&pass=testdat&cmd=login
* Die Konfiguration erfolgt oft direkt in Konfigurationsdateien und nicht in der grafischen Administrationsoberfläche. Die Konfigurationsmöglichkeiten sind aber gut dokumentiert und es finden sich auch viele Erklärungen innerhalb der Konfigurationsdateien.

Literaturempfehlung der ReferentInnen: Tutorial "Inbetriebnahme einer lokal installierten Demoversion von VuFind" von Stefan Niesner bei b.i.t.online: http://www.b-i-t-online.de/heft/VuFind/2016-02-tutorial.php

## Präsentation zu Forschungsdaten

Leif Klemstein und Jonas Engeland haben Metadaten aus dem Forschungsdaten-Repository [Zenodo](https://zenodo.org) über eine OAI-Schnittstelle heruntergeladen, diese mit OpenRefine bearbeitet und in den Suchindex geladen. Es ist ein Beispiel dafür, wie zusätzliche Open-Access-Dokumente im Bibliothekskatalog nachgewiesen werden können. Für den Download der Metadaten über die OAI-Schnittstelle von Zenodo wurde das Werkzeug [Catmandu](http://librecat.org/) eingesetzt.

Die Referenten haben ausführliche [Präsentationsfolien](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/slides/11_1_engeland_klemstein_forschungsdaten.pdf) zu ihrem Vorgehen erstellt, mit denen die Schritte detailliert nachvollzogen werden können.

## Präsentation zu Anpassungsmöglichkeiten von TYPO3-find

Theresa Sophia Joest und Elisa Server haben die Möglichkeiten zur Konfiguration und Gestaltung von TYPO3-find ausgetestet. Dabei hat sich herausgestellt, dass einige der in der Dokumentation angebotenen Anpassungsmöglichkeiten nicht in Verbindung mit unserer Installation über Docker-Container funktionieren. Die Beispielinstallationen der SUB Göttingen (wie z.B. die Klosterdatenbank Germania Sacra, vgl. Kapitel 10.2) demonstrieren, dass mit TYPO3-find sehr viele Funktionen umsetzbar sind, aber viele Konfigurationsmöglichkeiten sind nicht vollständig dokumentiert. TYPO3-find ist schlank und gut programmiert, aber hat im Vergleich zu VuFind keine große Anwendercommunity und bietet somit auch weniger erprobte Anleitungen. Für die Detailarbeit sind also vertiefte TYPO3-Kenntnisse erforderlich.

Im Projekt haben die ReferentInnen gestalterische Anpassungen präsentiert, wie beispielsweise die Veränderung des Webseitentitels, die Veränderung des Farbschemas und ein neues Layout für die Detailansicht. Sie haben zudem weitere Facetten angelegt. Umfangreichere inhaltliche Änderungen wie die Facettenfunktionen Histogramm oder Autovervollständigung haben in unserer Installation nicht funktioniert. Als Ursache werden Inkompatibilitäten zwischen dem Javascript-Frameworks unserer TYPO3-Installation (Introduction Package) und den Javascript-Funktionen von TYPO3-find vermutet.

Ein nachträglicher Test mit einer frischen Installation hat diese Erkenntnisse bestätigt. Eine Rückfrage an die Entwickler von TYPO3-find ist gestellt, aber noch offen (vgl. [Ticket in GitHub](https://github.com/subugoe/typo3-find/issues/121)).
