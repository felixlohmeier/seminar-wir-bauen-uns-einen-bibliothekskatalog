# 9.4 TYPO3-find anpassen

Über die Setup-Datei (vgl. den letzten Schritt aus Kapitel 9.3) kann die Erweiterung TYPO3-find konfiguriert werden.

## Aufgabe 1: Ergänzen Sie eine weitere Facette

Hinweise:

* Verwenden Sie das Feld ```Jahr``` für die Facette

Literatur:

* Dokumentation von TYPO3-find: http://typo3-find.readthedocs.io/en/latest/index.html

## Lösung

```
plugin.tx_find.settings {
        connections {
                default {
                        options {
                                host = my_solr
                                port = 8983
                                path = /solr/gettingstarted
                        }
                }
        }
        standardFields {
                title = Titel
                snippet = Urheber
        }
        facets {
                10 {
                        id = Medientyp
                        field = Medientyp
                        sortOrder = count
                }
                20 {
                        id = Sprache
                        field = Sprache
                        sortOrder = count
                }
                30 {
                        id = Jahr
                        field = Jahr
                        sortOrder = count
                }
        }
}
```

## Bonus: Darstellung der Trefferliste und Detailseite anpassen

Für die Anpassung der Detailseiten müssen gemäß der Dokumentation von TYPO3-find die Dateien ```Result.html``` und ```Detail.html``` im Ordner ```Resources/Private/Partials/Display/``` bearbeitet werden. Da diese im Docker-Container liegen, ist die Bearbeitung nicht ganz so einfach. Hier ein mögliches Vorgehen:

```
sudo docker exec -it typo3-web bash

apt-get install nano
export TERM=xterm

cd /var/www/html/typo3conf/ext/find/Resources/Private/Partials/Display/

nano Result.html
nano Detail.html
```
