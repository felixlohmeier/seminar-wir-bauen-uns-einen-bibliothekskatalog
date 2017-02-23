# 9.3 Erweiterung TYPO3-find installieren

Normalerweise können Erweiterungen für TYPO3 ganz einfach über die Administrationsoberfläche installiert werden, so bei einem App Store. Die EntwicklerInnen legen ihre Erweiterungen dazu im offiziellen TYPO3 Extension Repository ab. Leider ist zum Zeitpunkt der Erstellung des Skripts (Januar 2017) von der Erweiterung TYPO3-find nur eine uralte Version im Extension Repository verfügbar. Dort liegt Version 1.0.1 (Nov 2013), während bei GitHub Version 3.1.0 (Jan 2017) zur Verfügung steht.

## Vorgehen zur manuellen Installation von TYPO3-find aus GitHub

Wir installieren den Code aus dem GitHub-Repository https://github.com/subugoe/typo3-find

### Schritt 1: Code aus GitHub Repository herunterladen

```
git clone https://github.com/subugoe/typo3-find.git
cd typo3-find
```

### Schritt 2: PHP5 installieren

```
sudo apt-get update
sudo apt-get install php5
```

### Schritt 3: Abhängigkeiten der TYPO3-Erweiterung mit Composer nachladen

```
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '55d6ead61b29c7bdee5cccfb50076874187bd9f21f65d8991d46ec5cc90518f447387fb9f76ebae1fbbacf329e583e30') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
php composer.phar install
```

### Schritt 4: Daten in TYPO3-Container kopieren

```
docker exec typo3-web mkdir /var/www/html/typo3/ext
docker cp . typo3-web:/var/www/html/typo3/ext/find
docker exec typo3-web chown www-data:www-data /var/www/html/typo3/ext/find
```

### Schritt 5: Aufräumen

```
sudo apt-get update
sudo apt-get remove apache2 php5
sudo apt-get autoremove
```

## Extension in Administrationsoberfläche aktivieren

Login in Administrationsoberfläche unter http://localhost/typo3 (localhost durch IP-Adresse ersetzen)

### Schritt 1: Menü Extensions

* Neben Extension "Find" auf den Würfel klicken, um die Extension zu aktivieren

### Schritt 2: Menü Page

* Seite auswählen, auf welcher der Katalog eingefügt werden soll, hier ```Congratulations``` (Startseite)
* Folgende Kästen löschen (Mülleimer-Symbol): "Start browsing", "Example Pages", "Test the CMS", "Divider", "Make it your own"
* Button +Content in Spalte "Normal" drücken und im Reiter ```Plugins / General Plugin``` unten auf der Seite im Punkt ```Selected Plugin``` die Erweiterung ```Find``` auswählen und anschließend oben den Save-Button betätigen.

### Schritt 3: Menü Template

* Gleiche Seite auswählen, auf der vorhin das Plugin eingefügt wurde (müsste noch vorausgewählt sein)
* Im Pulldown oben ```Info/Modify``` auswählen
* Button ```Edit the whole template record```
* Reiter ```Includes```: Rechts bei ```available items``` die Option ```Find (find)``` anklicken
* Oben den Save-Button betätigen
* Reiter ```General```: In Textfeld ```Setup``` Folgendes einfügen

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
        }
}
```
