# 4.2 Übung: unAPI-Schnittstelle des GBV

Informationen zur unAPI-Schnittstelle des GBV: https://www.gbv.de/wikis/cls/unAPI

Für die unAPI wird stets eine PPN eines Datensatzes benötigt.

## Download mit curl

Beispiel:
* PPN: 834422018
* ID des Katalogs beim GBV: opac-de-18-302 (Katalog der HAW-Bibliothek)

PICA+
```
curl "http://unapi.gbv.de/?id=opac-de-18-302:ppn:834422018&format=pp" > 834422018.pp
```

PICA-XML
```
curl "http://unapi.gbv.de/?id=opac-de-18-302:ppn:834422018&format=picaxml" > 834422018.picaxml
```

MARC 21
```
curl "http://unapi.gbv.de/?id=opac-de-18-302:ppn:834422018&format=marc21" > 834422018.marc21
```

Weitere Formate
```
curl "http://unapi.gbv.de/?id=opac-de-18-302:ppn:834422018&format=marcxml" > 834422018.marcxml
curl "http://unapi.gbv.de/?id=opac-de-18-302:ppn:834422018&format=mods" > 834422018.mods
curl "http://unapi.gbv.de/?id=opac-de-18-302:ppn:834422018&format=dc" > 834422018.dc
curl "http://unapi.gbv.de/?id=opac-de-18-302:ppn:834422018&format=isbd" > 834422018.isbd
curl "http://unapi.gbv.de/?id=opac-de-18-302:ppn:834422018&format=picahtml" > 834422018.html
```