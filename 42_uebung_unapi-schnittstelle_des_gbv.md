# 4.2 Übung: unAPI-Schnittstelle des GBV

Informationen zur unAPI-Schnittstelle des GBV: https://www.gbv.de/wikis/cls/unAPI

Für die unAPI wird stets eine PPN eines Datensatzes benötigt.

## Aufgabe: Download mit curl

Lesen Sie die Dokumentation im Wiki des GBV und laden Sie mit dem Programm **curl** und der dort dokumentierten Beispielanfrage
```
http://unapi.gbv.de/?id=gvk:ppn:56677741X&format=mods
```
die Metadaten für einen beliebigen Katalogdatensatz der HAW-Bibliothek.

**Hinweise:**
* Sie können die Beispielanfrage auch in einem Browser aufrufen.
* Die http-Adresse müssen Sie bei **curl** in Anführungszeichen setzen, weil das Format mit einem &-Symbol übergeben wird, das sonst als Steuerzeichen interpretiert wird.
```
curl "http://..."
```
* Zum Speichern der Ausgabe als Datei können Sie am Ende des Befehls Folgendes anfügen (funktioniert für viele Linux-Programme):
```
> dateiname.txt
```

## Lösung

Beispiel:
* PPN: {%s%}834422018{%ends%}
* ID des Katalogs beim GBV: {%s%}opac-de-18-302{%ends%} (Katalog der HAW-Bibliothek)

PICA+
```
{%s%}curl "http://unapi.gbv.de/?id=opac-de-18-302:ppn:834422018&format=pp" > 834422018.pp{%ends%}
```

PICA-XML
```
{%s%}curl "http://unapi.gbv.de/?id=opac-de-18-302:ppn:834422018&format=picaxml" > 834422018.picaxml{%ends%}
```

MARC 21
```
{%s%}curl "http://unapi.gbv.de/?id=opac-de-18-302:ppn:834422018&format=marc21" > 834422018.marc21{%ends%}
```

Weitere Formate
```
{%s%}curl "http://unapi.gbv.de/?id=opac-de-18-302:ppn:834422018&format=marcxml" > 834422018.marcxml{%ends%}
{%s%}curl "http://unapi.gbv.de/?id=opac-de-18-302:ppn:834422018&format=mods" > 834422018.mods{%ends%}
{%s%}curl "http://unapi.gbv.de/?id=opac-de-18-302:ppn:834422018&format=dc" > 834422018.dc{%ends%}
{%s%}curl "http://unapi.gbv.de/?id=opac-de-18-302:ppn:834422018&format=isbd" > 834422018.isbd{%ends%}
{%s%}curl "http://unapi.gbv.de/?id=opac-de-18-302:ppn:834422018&format=picahtml" > 834422018.html{%ends%}
```