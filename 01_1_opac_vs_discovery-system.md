# 1.1 OPAC vs. Discovery-System

## Präsentation Gerald Steilen (2012)
http://www.slideshare.net/steilen/discoverysysteme-die-opacs-der-zukunft

![Screenshot Steilen 2012](/images/screenshot-steilen-2012.png)

## Kernpunkte
Der klassische Bibliothekskatalog (Online Public Access Catalogue, kurz: OPAC) wird von NutzerInnen nur noch selten als erster Einstieg gewählt. Gerald Steilen zitiert aus einer Studie von 2009 die folgenden Gründe:
* schlechte Nutzbarkeit
* hohe Komplexität
* fehlende Integration elektronischer Ressourcen.

Die Einführung von Discovery-Systemen erfolgte im deutschprachigen Raum etwa seit Ende der 2000er Jahre und sollte diesen Kritikpunkten begegnen. Discovery-Systeme versuchen die von Google und anderen Internetsuchmaschinen bekannte Suchfunktionalität (ein Suchschlitz und nach Relevanz sortierte Treffer) auf Bibliothekskataloge zu übertragen und auch elektronische Medien in einer übergreifenden Suche mit einzubeziehen.

Während OPACs eher auf möglichst exakte Suchergebnisse zielen, liefern Discovery-Systeme sehr viele Suchergebnisse, die ähnlich wie bei anderen Suchmaschinen mittels eines Algorithmus nach Relevanz sortiert werden. Der Algorithmus ist meist nicht besonders kompliziert und zählt einfach das Vorkommen der Suchbegriffe in den Katalogeinträgen. Treffer in bestimmten Feldern wie Titel und Autor/in sind mehr wert als Treffer im Beschreibungstext oder in Verlagsangaben. Daraus errechnet die Suchmaschine einen Ergebniswert und sortiert die Trefferliste entsprechend.

Gerald Steilen weist in seinem Vergleich (Folie 16/17) auf wichtige Unterschiede der beiden Konzepte hin. Während beim OPAC die NutzerInnen ihre Suchanfrage präzise formulieren müssen und dazu den Katalog und den Bibliotheksbestand gut kennen müssen, können NutzerInnen beim Discovery-System auch ohne besonderes Vorwissen nach beliebigen Begriffen suchen und erhalten eine sortierte Trefferliste. Durch eine hohe Fehlertoleranz werden sehr viele Treffer gefunden – unter denen dann aber oft auch unpassende Treffer dabei sind.

Discovery-Systeme versprechen eine intuitive Nutzbarkeit. Das bedeutet aber nicht, dass die Systemeinführung ebenso "von der Stange" funktioniert. Es ist wichtig, das System richtig zu konfigurieren und auf die Bibliotheksbestände anzupassen. Um gute Filtermöglichkeiten (Facetten) anbieten zu können, müssen Felder in den Metadaten identifiziert werden, die geeignet und einheitlich belegt sind. Gegebenenfalls sind die Katalogeinträge vorher nachzubearbeiten oder zu bereinigen.

Die Systemarchitektur von Discovery-Systemen lässt sich in eine Suchmaschine und eine Oberfläche/Webseite trennen. In der Suchmaschine werden die Katalogeinträge indexiert. Die NutzerInnen rufen die Webseite mit der Katalogoberfläche auf und geben dort ihre Suchanfrage ein. Im Hintergrund gibt die Oberfläche die Anfrage an die Suchmaschine weiter und erhält von dieser ein Ergebnis (eine Trefferliste) zurück. Die NutzerInnen hingegen erhalten dieses Ergebnis grafisch aufbereitet auf der Webseite der Katalogoberfläche.

Funktionen zur Ausleihe, zur Verwaltung des Benutzerkontos und zur Anzeige von aktuellen Verfügbarkeitsinformationen sind oft nicht direkter Bestandteil des Discovery-Systems, sondern Teil des "Lokalsytems" (vgl. Folie 19). Damit ist das System gemeint, in dem die Bibliothek "verwaltet" wird, also in dem die Ausleihe, die Erwerbung und die Katalogisierung stattfindet. Discovery-System und Lokalsystem kommunizieren über eine Schnittstelle miteinander, so dass die Informationen aus dem Lokalsystem im Katalog live angezeigt werden können (beispielsweise der Ausleihstatus von Büchern).