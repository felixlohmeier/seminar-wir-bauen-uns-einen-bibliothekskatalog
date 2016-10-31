# Skript zum Seminar "(Open) Discovery: Wir bauen uns einen Bibliothekskatalog"

## Formate
* Lesefassung bei GitBook (HTML): https://www.gitbook.com/read/book/felixlohmeier/seminar-wir-bauen-uns-einen-bibliothekskatalog
* Druckfassung bei GitBook (PDF): https://www.gitbook.com/download/pdf/book/felixlohmeier/seminar-wir-bauen-uns-einen-bibliothekskatalog
* Repository bei GitHub (zum Nachnutzen): https://github.com/felixlohmeier/seminar-wir-bauen-uns-einen-bibliothekskatalog 

## Lehrveranstaltung

Dieses Skript entsteht im Rahmen der folgenden Lehrveranstaltung:

* Seminar (Open) Discovery: Wir bauen uns einen Bibliothekskatalog
* Dozent: [Felix Lohmeier](http://felixlohmeier.de)
* Wintersemester 2016/17
* Lehrauftrag an der [HAW Hamburg, Fakultät Design, Medien und Information](https://www.haw-hamburg.de/department-information.html)
* Modulangebot Informationstechnologie für die Studiengänge Bibliotheks- und Informationsmanagement (BIM) und Medien und Information (MUI)
* Bachelor 3. bis 6. Semester

## Intention Openness

Soweit möglich werden die Materialien für die Lehrveranstaltung an dieser Stelle online gestellt, damit sie vielleicht auch über den Kreis der SeminarteilnehmerInnen hinaus nützlich sind. Das passt ja zum Thema ;-).

## Inhalte

Die Inhalte werden sukzessive hier bereitgestellt. Jede Lerneinheit umfasst zwei akademische Doppelstunden, also insgesamt 3 Zeitstunden. Folgender Ablauf ist vorgesehen:

1. Vorlesung: [Einführung in Discovery-Systeme in Bibliotheken](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/01_0_Einfuehrung-Discovery-Systeme.html) (19.09.2016) 
2. Vorlesung: [Open-Source-Software für Bibliothekskataloge](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/02_0_Open-Source-Software_fuer_Bibliothekskataloge.html) (26.09.2016) 
3. Praxis: [Grundinstallation der Arbeitsumgebung](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/03_0_grundinstallation_der_arbeitsumgebung.html) (10.10.2016)
4. Praxis: [Schnittstellen zum Laden der Metadaten](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/04_0_schnittstellen_zum_laden_der_metadaten.html) (17.10.2016) 
5. Vorlesung: Exkurs zu Metadaten in Bibliotheken (24.10.2016)
6. Praxis: [Installation von OpenRefine mit Docker](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/06_0_installation_von_openrefine_mit_docker.html) (31.10.2016)
7. Praxis [2x]: [Datentransformation mit OpenRefine](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/07_0_datentransformation_mit_openrefine.html) (07.11.2016, 14.11.2016)
8. Praxis: Installation des Suchmaschinenindex (Solr) (21.11.2016)
9. Praxis [2x]: Konfiguration und Übungen mit Solr
10. Vorlesung: Relevanzranking, Facettierung und weitere Katalogfunktionen
11. Praxis: Installation der Katalogoberfläche (TYPO3-find)
12. Praxis [3x]: Konfiguration von TYPO3-find
13. Vorlesung: Was fehlt noch für einen Produktivbetrieb?
14. Evaluation und Abschlussbesprechung

## Lerntagebücher

Als eine mögliche [Prüfungsleistung](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/pruefungsleistungen.html) schreiben Studierende öffentliche Lerntagebücher, in denen sie von ihren Erkenntnissen berichten und sich mit dem Inhalt des Seminars auseinandersetzen.

Die Blogs der Studierenden sind unter der Rubrik [Lerntagebücher](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/lerntagebucher.html) aufgeführt. Thematisch relevante Beiträge sind in den jeweiligen Kapiteln im Skript verlinkt.

## Beschreibung (aus dem Vorlesungsverzeichnis)

Zeitgemäße Recherchesysteme bedienen sich moderner Suchmaschinentechnologien. So haben die meisten größeren Bibliotheken in den letzten 10 Jahren ihre klassischen Online-Kataloge (OPACs) auf modernere Discovery-Systeme umgestellt. Diese Systeme sind allerdings trotz standardisierter Webtechnologien keine Selbstläufer. Egal ob gekauft oder selbst entwickelt, das Ranking nach Relevanz bringt nur dann richtig gute Ergebnisse, wenn die Bestände der Bibliothek für die jeweilige Zielgruppe klug aufbereitet werden. Dafür müssen Bibliothekarinnen und Bibliothekare sich immer intensiver mit der zugrundeliegenden Technik und den (Meta)daten auseinandersetzen.

Der Einstieg in die mysteriös anmutende Discovery-Technik fällt oft schwer, die Zusammenhänge sind in der Theorie manchmal unverständlich. Daher ist es am besten, die Technik selbst auszuprobieren und einen Blick unter die Haube zu werfen. Dank der freien Verfügbarkeit von Open-Source-Anwendungen für Metadatenmanagement und Katalogpräsentation ist das möglich geworden.

In diesem Wahlpflichtmodul werden wir in praktischen Übungen reale Bibliotheksdaten verarbeiten und einen Prototyp eines modernen Discovery-Systems aufsetzen. Programmierkenntnisse sind dafür nicht erforderlich. Der Kurs ist ausgerichtet auf Studierende für Bibliotheks- und Informationsmanagement, aber aufgrund des praxisnahen Einsatzes von Suchmaschinentechnologien auch für den Studiengang Medien und Information relevant. Die praktischen Übungen werden in der Vorlesungszeit in den PC-Pools der HAW durchgeführt.

## Literaturempfehlungen

* Anne Christensen (2013): Warum BibliothekarInnen bei Discovery mitmischen sollten, trotz allem. In: Blog "A growing organism - Bibliothekarische An- und Aussichten von Anne Christensen", 20.4.2013: https://xenzen.wordpress.com/2013/04/20/discovery-mitmischen/
* Prof. Magnus Pfeffer (2016): Open Source Software zur Verarbeitung und Analyse von Metadaten. Präsentation auf dem 6. Bibliothekskongress. http://nbn-resolving.de/urn/resolver.pl?urn:nbn:de:0290-opus4-24490
* Christof Rodejohann & Felix Lohmeier (2016): Schlanke Discovery-Lösung auf Basis von TYPO3. Der neue Bibliothekskatalog der SLUB Dresden. Präsentation im Rahmen des "Bibcast", Live-Webcast im Vorfeld des Bibliothekskongresses, 9.3.2016: http://bibcast.openbiblio.eu/schlanke-discovery-loesung-auf-basis-von-typo3-der-neue-bibliothekskatalog-der-slub-dresden/
* Felix Lohmeier & Jens Mittelbach (2014): Offenheit statt Bündniszwang. In: Zeitschrift für Bibliothekswesen und Bibliographie 61, H. 4-5, S. 209-214. http://dx.doi.org/10.3196/1864295014614554 

## Lizenz

Dieses Werk ist lizenziert unter einer [Creative Commons Namensnennung 4.0 International Lizenz](http://creativecommons.org/licenses/by/4.0/)

[![Creative Commons Lizenzvertrag](https://i.creativecommons.org/l/by/4.0/88x31.png)](http://creativecommons.org/licenses/by/4.0/)
