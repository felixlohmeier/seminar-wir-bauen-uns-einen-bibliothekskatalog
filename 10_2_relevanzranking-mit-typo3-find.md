# 10.2 Relevanzranking mit TYPO3-find

TYPO3-find basiert auf dem Suchindex Solr, weshalb für das Relevanzranking die Konfigurationsmöglichkeiten von Solr genutzt werden können. Diese werden in der Datei ```solrconfig.xml``` definiert.

Die SUB Göttingen hat im Projekt Germania Sacra TYPO3-find für eine Klosterdatenbank eingesetzt. Der Quellcode steht auf GitHub. Hier der entsprechende Auszug aus der Konfiguration, in dem die Gewichtung der Felder zu erkennen ist:

```
<!-- Query settings -->
<str name="defType">edismax</str>
<str name="qf">
	text^0.5 features^1.0 name^1.2 sku^1.5 id^10.0 manu^1.1 cat^1.4
	title^10.0 description^5.0 keywords^5.0 author^2.0 resourcename^1.0
</str>
(...)
```

Treffer im Feld ```title``` (Titel) werden mit Faktor 10 am höchsten gewichtet, während Treffer im Feld ```text``` (Beschreibungstext) mit Faktor 0,5 relativ unwichtig für die Sortierung der Trefferliste sind. Das Beispiel zeigt, dass eine Verbesserung der Relevanzsortierung von Trefferlisten in der Praxis bereits durch eine einfache Gewichtung der Felder erzielt werden kann.

Links:

* Klosterdatenbank Germania Sacra: http://klosterdatenbank.germania-sacra.de/
* solrconfig.xml von Germania Sacra: https://github.com/subugoe/germania-sacra-daten/blob/master/solr/conf/solrconfig.xml#L401

Aus Zeitgründen musste die praktische Übung mit TYPO3-find leider entfallen.
