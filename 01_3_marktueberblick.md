# 1.3 Marktüberblick

## Bericht von Marshall Breeding (2014)
https://journals.ala.org/ltr/issue/view/195

[![Screenshot Breeding 2014](images/screenshot-breeding-2014.png)](https://journals.ala.org/ltr/issue/view/195)

## Kernpunkte

Der Autor Marshall Breeding schreibt seit längerer Zeit zusammenfassende Berichte über den Stand von IT-Systemen in Bibliotheken und hat insbesondere über die Entwicklung von Discovery-Systemen berichtet. Er war von 1985 bis 2012 in einer Bibliothek in den USA tätig und ist gleichzeitig seit 1985 als IT-Berater tätig. Durch seine Arbeit ist er den kommerziellen Anbietern recht nah und kann daher einen guten Marktüberblick geben, gleichzeitig ist er nicht völlig unabhängig, was bei der Rezeption der Texte zu beachten ist.

Sein umfassender Bericht von 2014 in der Zeitschrift ALA TechSource bietet einen guten Einstieg. Den Ergebnissen der Befragung ist zu entnehmen, dass den Markt in den USA nur wenige Anbieter prägen. Bei wissenschaftlichen Bibliotheken sind dies 2014 insbesondere:
* Ex Libris: Primo / Primo Central
* ProQuest: Summon
* OCLC: WorldCat local
* EBSCO: EBSCO Discovery Service
* iii: Encore (auf Basis von EBSCO Discovery Service)

Es gibt zwar noch eine Reihe von anderen Anbietern, aber diese sind vor allem an kleineren Einrichtungen oder mit geringen Installationszahlen auf dem Markt für wissenschaftliche Bibliotheken tätig. Open-Source-Systeme wie VuFind sind ebenfalls noch recht wenig verbreitet.

Von großer Bedeutung sind die von den Anbietern aufgebauten Indizes mit elektronischen Artikeln, die zusammen mit dem Discovery-Produkt, manchmal aber auch allein lizenziert werden können. Die Anbieter übernehmen dabei die Aufgabe, die Metadaten zu lizenzpflichtigen und lizenzfreien Online-Ressourcen aus verschiedenen Quellen zusammenzutragen und zu normalisieren. Der daraus resultierende "Gesamtindex" wird dann mit den Lizenzen der Kunden ("Holdings") abgeglichen und im Discovery-System integriert oder in einem separaten Suchraum "Elektronische Artikel" oder ähnlich bereitgestellt.

Zum genaueren Verständnis der Funktion des Gesamtindex ("Central Index") ist ergänzend der folgende Artikel von Athena Hoeppner von 2012 hilfreich: [The Ins and Outs of Evaluating Web-Scale Discovery Services](http://www.infotoday.com/cilmag/apr12/Hoeppner-Web-Scale-Discovery-Services.shtml). In: Computers in Libraries, April 2012.

## Neuere Entwicklungen

Seit dem Artikel aus 2014 hat im Zuge der Einführung von Cloud-Lösungen und durch eine große Übernahme eine weitere Marktkonzentration stattgefunden:
* ProQuest hat Ende 2015 Ex Libris aufgekauft. Die beiden Produktlinien Summon und Primo existieren derzeit noch parallel, werden aber vermutlich zukünftig zusammengeführt.
* Ex Libris Primo wird mittlerweile vor allem in Kombination mit ALMA (einem kompletten Bibliothekssystem) als Cloud-Lösung verkauft. Das gleiche gilt für OCLC, die ihre Cloud-Lösung WorldShare Management Services als neues Hauptprodukt bewerben.
* OCLC und Ex Libris verfolgen beide das Ziel den Austausch von Metadaten vor allem innerhalb ihrer Kundschaft zu forcieren. So gibt es bei ALMA eine "Common Bibliographic Data Zone" und bei OCLC die Integration des "WorldCat". Durch die Verfügbarkeit von geteilten Metadaten zur Katalogisierung und Erwerbung innerhalb der Systeme versprechen die Firmen den Bibliotheken Arbeitserleichterungen und sich selbst einen Marktvorteil. In Kombination mit der engen Kopplung der Bibliothekssysteme mit den Discovery-Systemen und der Angebote als Cloud-Lösungen entstehen hohe Abhängigkeiten. Ein Wechsel zwischen den Anbietern oder die Nutzung einzelner Komponenten wird erschwert. Das führt zu einem [Vendor-lockin](https://en.wikipedia.org/wiki/Vendor_lock-in).
* EBSCO ist nicht nur Anbieter von Bibliothekssoftware, sondern betreibt auch Fachdatenbanken. In Konkurrenz zu anderen Anbietern versucht EBSCO daraus einen Vorteil zu gewinnen, indem es die Inhalte der Fachdatenbanken bevorzugt im eigenen Discovery-System-Index verfügbar macht. Darüber ist 2013-2015 ein Streit mit Ex Libris entbrannt, woraufhin Kunden von Ex Libris versucht haben eine Einigung herbeizuführen (siehe Zusammenfassung der ORBIS CASCADE ALLIANCE, einem Zusammenschluss von amerikanischen Universitätsbibliotheken: https://www.orbiscascade.org/ebsco-ex-libris/).
* Um den Komplettlösungen von OCLC und Ex Libris zu begegnen, hat EBSCO zudem Mitte 2016 [in das Open-Source-Projekt Kuali OLE investiert](https://www.ebsco.com/e/de-de/nachrichten-center/pressemitteilungen-in-deutscher-sprache/folio-die-neue-kooperation-bringt-bibliotheken-dienstleister-und-entwickler) und dieses unter neuem Namen [FOLIO](https://www.folio.org) herausgebracht. Zusammen mit der Firma Index Data wird eine Alternative zu den Komplettlösungen von Ex Libris und OCLC entwickelt. Ob der angekündigte Weg der Open-Source-Community tatsächlich in Reinform eingehalten wird oder doch Abhängigkeiten geschaffen werden, bleibt noch abzuwarten.

Marshall Breeding schreibt regelmäßig Berichte unter dem Titel "Library Systems Report". Der diesjährige [Artikel von 2016](https://americanlibrariesmagazine.org/2016/05/02/library-systems-report-2016/) ist mit "Power plays" untertitelt. Das spielt auf die oben beschriebene zunehmende Marktkonzentration an.

## Open Discovery

Es gibt Bestrebungen, die Discovery-Systeme möglichst unabhängig von Bibliothekssystemen einsetzbar zu halten und zu gewährleisten, dass wissenschaftliche Inhalte unabhängig von Marktinteressen in allen Discovery-Systemen nachgewiesen werden können.

In den USA hat die ["Open Discovery Initiative (ODI)"](http://www.niso.org/workrooms/odi/) des Standardisierungsgremiums NISO eine umfangreiche Empfehlung dazu herausgegeben: 
[NISO RP-19-2014: A Recommended Practice of the  National Information Standards Organization](http://www.niso.org/workrooms/odi/publications/rp/rp-19-2014)

Im Seminar verfolgen wir einen herstellerunabhängigen, modularen Ansatz. Daher das "(Open) Discovery" im Titel des Seminars.