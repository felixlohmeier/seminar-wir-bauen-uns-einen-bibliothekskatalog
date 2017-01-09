# 8.3 TSV-Dateien in Solr laden

## Konfiguration neu einlesen

* Menü "Core Admin" http://192.168.1.1:8983/solr/#/~cores/gettingstarted
* Button "Reload" drücken

## Index leeren (im Terminal)

Der folgende Befehl löscht alle Daten im Index ```gettingstarted```

```
curl "http://localhost:8983/solr/gettingstarted/update?commit=true&stream.body=%3Cdelete%3E%3Cquery%3E*%3A*%3C/query%3E%3C/delete%3E"
```

## Daten laden (im Terminal)

Der folgende Befehl indexiert die Daten aus der Datei ```haw-prozessiert.tsv```. Der Befehl ist so lang, weil Solr mitgeteilt werden muss, welche Felder mehrfachbelegt sind und mit welchem Zeichen diese getrennt sind. Die Laufzeit beträgt etwa 5 Minuten. Währenddessen kommt keine Statusmeldung, also haben Sie ein wenig Geduld.

```
cd ~/tsv/
curl "http://localhost:8983/solr/gettingstarted/update/csv?commit=true&separator=%09&f.ISBN.split=true&f.ISBN.separator=%E2%90%9F&f.ISSN.split=true&f.ISSN.separator=%E2%90%9F&f.Sprache.split=true&f.Sprache.separator=%E2%90%9F&f.LCC.split=true&f.LCC.separator=%E2%90%9F&f.DDC.split=true&f.DDC.separator=%E2%90%9F&f.Urheber.split=true&f.Urheber.separator=%E2%90%9F&f.Ort.split=true&f.Ort.separator=%E2%90%9F&f.Verlag.split=true&f.Verlag.separator=%E2%90%9F&f.Datum.split=true&f.Datum.separator=%E2%90%9F&f.Beschreibung.split=true&f.Beschreibung.separator=%E2%90%9F&f.Schlagwoerter.split=true&f.Schlagwoerter.separator=%E2%90%9F&f.Beitragende.split=true&f.Beitragende.separator=%E2%90%9F&f.Reihe.split=true&f.Reihe.separator=%E2%90%9F&f.Vorgaenger.split=true&f.Vorgaenger.separator=%E2%90%9F&f.Nachfolger.split=true&f.Nachfolger.separator=%E2%90%9F&f.Link.split=true&f.Link.separator=%E2%90%9F&f.Titel.split=true&f.Titel.separator=%E2%90%9F" --data-binary @haw-prozessiert.tsv -H 'Content-type:text/plain; charset=utf-8'
```

Wenn Sie lieber die Daten aus der automatischen Verarbeitung indexieren wollen, dann wechseln Sie in das Verzeichnis ```~/refine/```, schauen Sie mit ```ls``` wie die Datei heißt und ersetzen Sie am Ende des Befehls ```haw-prozessiert.tsv``` durch den den Dateinamen.

Literatur:

* https://wiki.apache.org/solr/UpdateCSV#Updating_a_Solr_Index_with_CSV

## Prüfen Sie das Ergebnis

Rufen Sie die Browsing-Oberfläche auf (http://192.168.1.1:8983/solr/gettingstarted/browse). Es sollten über 200.000 Dokumente gefunden werden. Machen Sie ein paar Beispielsuchen, um sicherzugehen, dass die Daten richtig indexiert wurden.

## Solr beenden und starten

Der Docker-Container my_solr wurde in Kapitel 8.1 als Hintergrundprozess gestartet, der bis zum nächsten Neustart des Rechners weiterlaufen sollte. Sie können den Container jederzeit manuell beenden und starten.

Solr beenden:

```
sudo docker stop my_solr
```

Solr starten:

```
sudo docker start my_solr
```

Etwa 15-30 Sekunden nach dem Startbefehl sollte die Administrations- und die Browsingoberfläche unter den gewohnten Adressen erreichbar sein.