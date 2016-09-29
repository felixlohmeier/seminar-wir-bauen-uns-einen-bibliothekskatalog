# 2.3 Auswahl der Software für das Seminar

## Software, die wir im Seminar verwenden werden

**Verarbeitung und Analyse der Metadaten**: [OpenRefine](http://openrefine.org)

OpenRefine bietet eine grafische Oberfläche zur Analyse und Transformation von Daten, die ähnlich wie eine klassische Tabellenverarbeitungssoftware (MS Excel, LibreOffice Calc, usw.) aufgebaut ist. Wir verwenden diese Software im Seminar um die Ausgangsdaten aus dem Bibliothekssystem zu manipulieren und in ein passendes Format für den Suchmaschinenindex zu transformieren.

**Suchmaschinenindex**: [Solr](http://lucene.apache.org/solr/)

Apache Solr ist eine der Standardsuchmaschinen, die auch in vielen kommerziellen Discovery-Systemen zum Einsatz kommt. Die Indexierung der Daten in Solr ermöglicht sehr schnelle und flexible Suchen. Der Suchmaschinenindex läuft im Hintergrund, wird von den Nutzerinnen und Nutzern also nie direkt aufgerufen.

**Katalogoberfläche**: [TYPO3-find](https://github.com/subugoe/typo3-find)

Das, was die Nutzerinnen und Nutzer zu sehen bekommen, ist schließlich die Katalogoberfläche. Im Grunde handelt es sich um eine Webseite mit Suchfunktion. Wir verwenden im Seminar die Software TYPO3-find, eine Erweiterung für das Content-Management-System TYPO3, die an der Staats- und Universitätsbibliothek Göttingen entwickelt wurde. TYPO3-find kommuniziert mit dem Suchmaschinenindex Solr über die Software [Solarium](http://www.solarium-project.org/), die ebenfalls Open Source ist.

## Schaubild zum Datenfluss

```
                             Transform             Search                Website
+----------------+         +------------+         +------+            +------------+
|                | Extract |            |  Load   |      |  Solarium  |            |
| Library System | +-----> | OpenRefine | +-----> | Solr | +--------+ | TYPO3-find |
|                |         |            |         |      |            |            |
+----------------+         +------------+         +------+            +------------+
                            PICA+ -> TSV
```

## Alternativen, die auch interessant wären

Es gibt eine ausgereifte Komplettlösung, die alle drei Funktionen (Verarbeitung der Metadaten, Suchmaschinenindex und Katalogoberfläche) in einer Open-Source-Lösung vereint: [VuFind](http://vufind-org.github.io/vufind/). Diese Lösung kann am ehesten als vollständiger Ersatz für ein kommerzielles Discovery-System gelten (mal abgesehen vom "Central Index" für elektronische Artikel). Wir verwenden VuFind in diesem Seminar nicht, weil die Software zu viele Schritte im Hintergrund erledigt, die das Verständnis der zugrundeliegenden Prozesse erschweren würden. VuFind ist international an vielen Bibliotheken im Einsatz und hat eine sehr aktive Community. In Deutschland finden regelmäßig Anwendertreffen statt, [im Oktober 2016 beispielsweise in Freiburg](https://www.ub.uni-freiburg.de/ihre-ub/veranstaltungen/vufind-anwendertreffen/). Die lange Historie von VuFind (Entwicklung seit 2008) ist gleichzeitig Hauptkritikpunkt: Der Code ist "gewachsen" und entsprechend schwierig zu warten. Die Komplettlösung ist wenig modular aufgebaut und damit schwieriger in andere Systeme integrierbar.

Neu auf dem Markt ist auch die Komplettlösung [Lukida](https://www.lukida.org/), die vom Bibliotheksverbund GBV als Service angeboten wird und auch als [Open Source](https://github.com/gbv/Lukida) zur Verfügung steht. Die Software ist in PHP entwickelt und zeichnet sich durch einen neuen Ansatz in der Darstellung der Suchergebnisse aus.

Alternativen für die Verarbeitung und Analyse der Metadaten wurden im vorigen Kapitel bereits vorgestellt. Für das Ziel des Seminars kämen vor allem Catmandu und d:swarm in Frage. [Catmandu](http://librecat.org/) muss über die Kommandozeile gesteuert werden und hat damit eine höhere Einstiegshürde für diejenigen, die grafische Oberflächen aus Windows gewohnt sind. [d:swarm](http://www.dswarm.org) hingegen bietet einen optischen Zugang, ist jedoch noch in einem frühen Entwicklungsstadium und hat eine relativ komplexe Systemarchitektur.

Als Alternative für die Katalogoberfläche ist noch [Blacklight](http://projectblacklight.org/) zu nennen, das in Universitätsbibliotheken in den USA weit verbreitet ist.