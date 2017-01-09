# 8.1 Installation von Solr mit Docker

Für die Installation von Solr nutzen wir wieder Docker. Es gibt ein Repository für Solr im Docker Hub, dass von Docker selbst gepflegt und daher als "offiziell" markiert ist: https://hub.docker.com/_/solr/

Literatur:

* http://reasoncodeexample.com/2016/06/29/dock-the-pain-away-running-solr-in-docker/
* https://lucidworks.com/blog/2015/11/03/solr-on-docker-2/

## Aufgabe 1: Installieren Sie Solr, legen Sie einen Index an, laden Sie Beispieldaten und machen Sie sich mit Administrationsoberfläche und integrierter Suchoberfläche vertraut

Hinweise:

* Folgen Sie der [Installationsanleitung im Docker Hub](https://hub.docker.com/_/solr/) unter der Überschrift "Run Solr and index example data".
* Ein Index wird innerhalb von Solr auch als "Core" bezeichnet.
* Machen Sie sich mit der Administrationsoberfläche vertraut.
* Testen Sie die integrierte Suchoberfläche. Diese erreichen Sie, wenn Sie an die Administrationsoberfläche den Pfad ```/solr/gettingstarted/browse``` anhängen.

## Lösung

* Docker-Container starten: {%s%}sudo docker run --name my_solr -d -p 8983:8983 -t solr{%ends%}
* Index anlegen: {%s%}sudo docker exec -it --user=solr my_solr bin/solr create_core -c gettingstarted{%ends%}
* Beispieldaten laden: {%s%}sudo docker exec -it --user=solr my_solr bin/post -c gettingstarted example/exampledocs/manufacturers.xml{%ends%}
* Administrationsoberfläche: {%s%}Beispiel: http://192.168.1.1:8983{%ends%}
* Integrierte Suchoberfläche: {%s%}Beispiel: http://192.168.1.1:8983/solr/gettingstarted/browse{%ends%}

## Aufgabe 2: Lernen Sie die Abfragemöglichkeiten von Solr kennen

Disclaimer: Die folgenden Schritte sind aus der ["Quickstart" Anleitung von Solr](http://lucene.apache.org/solr/quickstart.html) entnommen und für die Verwendung mit Docker neu zusammengestellt und abgewandelt.

Hinweise:

* Ersetzen Sie ```localhost``` jeweils durch die IP-Adresse von Ihrem Webserver (Beispiel: 192.168.1.1).

### Indexing data

The Solr install includes the ```bin/post``` tool in order to facilitate getting various types of documents easily into Solr from the start. We'll be using this tool for the indexing examples below.

Let's first index local files in many formats. ```bin/post``` features the ability to crawl a directory of files, optionally recursively even, sending the raw content of each file into Solr for extraction and indexing.

A Solr install includes a example/exampledocs/ subdirectory, so that makes a convenient set of files built-in to start with.

```
sudo docker exec -it --user=solr my_solr bin/post -c gettingstarted example/exampledocs/
```

Here's what it'll look like:

```
/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java -classpath /opt/solr/dist/solr-core-6.3.0.jar -Dauto=yes -Dc=gettingstarted -Ddata=files -Drecursive=yes org.apache.solr.util.SimplePostTool example/exampledocs/
SimplePostTool version 5.0.0
Posting files to [base] url http://localhost:8983/solr/gettingstarted/update...
Entering auto mode. File endings considered are xml,json,jsonl,csv,pdf,doc,docx,ppt,pptx,xls,xlsx,odt,odp,ods,ott,otp,ots,rtf,htm,html,txt,log
Entering recursive mode, max depth=999, delay=0s
Indexing directory example/exampledocs (19 files, depth=0)
POSTing file money.xml (application/xml) to [base]
POSTing file gb18030-example.xml (application/xml) to [base]
POSTing file utf8-example.xml (application/xml) to [base]
POSTing file more_books.jsonl (application/json) to [base]/json/docs
POSTing file manufacturers.xml (application/xml) to [base]
POSTing file ipod_video.xml (application/xml) to [base]
POSTing file sample.html (text/html) to [base]/extract
POSTing file monitor2.xml (application/xml) to [base]
POSTing file ipod_other.xml (application/xml) to [base]
POSTing file solr-word.pdf (application/pdf) to [base]/extract
POSTing file books.csv (text/csv) to [base]
POSTing file mp500.xml (application/xml) to [base]
POSTing file sd500.xml (application/xml) to [base]
POSTing file mem.xml (application/xml) to [base]
POSTing file monitor.xml (application/xml) to [base]
POSTing file vidcard.xml (application/xml) to [base]
POSTing file books.json (application/json) to [base]/json/docs
POSTing file hd.xml (application/xml) to [base]
POSTing file solr.xml (application/xml) to [base]
19 files indexed.
COMMITting Solr index changes to http://localhost:8983/solr/gettingstarted/update...
Time spent: 0:00:04.283
```

The command-line breaks down as follows:

* ```-c gettingstarted```: name of the collection to index into
* ```example/exampledocs/```: a relative path of the Solr install ```exampledocs/``` directory

You have now indexed fifty documents into the gettingstarted collection in Solr and committed these changes. You can search for "solr" by loading the Admin UI Query tab (http://localhost:8983/solr/#/gettingstarted/query), enter "solr" in the q param (replacing *:*, which matches all documents), and "Execute Query".

You can browse the documents indexed at http://localhost:8983/solr/gettingstarted/browse. The /browse UI allows getting a feel for how Solr's technical capabilities can be worked with in a familiar, though a bit rough and prototypical, interactive HTML view.

Solr supports indexing structured content in a variety of incoming formats. The historically predominant format for getting structured content into Solr has been Solr XML. Solr supports indexing JSON, either arbitrary structured JSON or "Solr JSON" (which is similar to Solr XML). A great conduit of data into Solr is via CSV, especially when the documents are homogeneous by all having the same set of fields. CSV can be conveniently exported from a spreadsheet such as Excel, or exported from databases such as MySQL. When getting started with Solr, it can often be easiest to get your structured data into CSV format and then index that into Solr rather than a more sophisticated single step operation.

* XML: ```sudo docker exec -it --user=solr my_solr bin/post -c gettingstarted example/exampledocs/manufacturers.xml```
* CSV: ```sudo docker exec -it --user=solr my_solr bin/post -c gettingstarted example/exampledocs/books.csv```
* JSON: ```sudo docker exec -it --user=solr my_solr bin/post -c gettingstarted example/exampledocs/more_books.jsonl```

### Updating Data

You may notice that even if you index content more than once, it does not duplicate the results found. This is because the example ```schema.xml``` specifies a ```uniqueKey``` field called ```id```. Whenever you POST commands to Solr to add a document with the same value for the ```uniqueKey``` as an existing document, it automatically replaces it for you. You can see that that has happened by looking at the values for ```numDocs``` and ```maxDoc``` in the core-specific Overview section of the Solr Admin UI (http://localhost:8983/solr/#/gettingstarted)

```numDocs``` represents the number of searchable documents in the index (and will be larger than the number of XML, JSON, or CSV files since some files contained more than one document). The ```maxDoc``` value may be larger as the ```maxDoc``` count includes logically deleted documents that have not yet been physically removed from the index. You can re-post the sample files over and over again as much as you want and ```numDocs``` will never increase, because the new documents will constantly be replacing the old.

### Deleting Data

You can delete data by POSTing a delete command to the update URL and specifying the value of the document's unique key field, or a query that matches multiple documents (be careful with that one!). Since these commands are smaller, we specify them right on the command line rather than reference a JSON or XML file.

Execute the following command to delete a specific document:

```
sudo docker exec -it --user=solr my_solr bin/post -c gettingstarted -d "<delete><id>SP2514N</id></delete>"
```

### Searching

Solr can be queried via REST clients, cURL, wget, Chrome POSTMAN, etc., as well as via the native clients available for many programming languages.

The Solr Admin UI includes a query builder interface - see the ```gettingstarted``` query tab at http://localhost:8983/solr/#/gettingstarted/query. If you click the ```Execute Query``` button without changing anything in the form, you'll get 10 documents in JSON format (```*:*``` in the ```q``` param matches all documents).

The URL sent by the Admin UI to Solr is shown in light grey near the top right of the window - if you click on it, your browser will show you the raw response. To use cURL, give the same URL in quotes on the curl command line:

```
curl "http://localhost:8983/solr/gettingstarted/select?indent=on&q=*:*&wt=json"
```

#### Search for a single term

To search for a term, give it as the q param value in the core-specific Solr Admin UI Query section, replace ```*:*``` with the term you want to find. To search for "foundation":

```
curl "http://localhost:8983/solr/gettingstarted/select?wt=json&indent=true&q=foundation"
```

You'll see:
```
{
  "responseHeader":{
    "status":0,
    "QTime":4,
    "params":{
      "q":"foundation",
      "indent":"true",
      "wt":"json"}},
  "response":{"numFound":3,"start":0,"docs":[
      {
        "id":"0553293354",
        "cat":["book"],
        "name":["Foundation"],
```

The response indicates that there are 3 hits (```"numFound":3```), of which the first 10 were returned, since by default ```start=0``` and ```rows=10```. You can specify these params to page through results, where ```start``` is the (zero-based) position of the first result to return, and ```rows``` is the page size.

To restrict fields returned in the response, use the ```fl``` param, which takes a comma-separated list of field names. E.g. to only return the ```id``` field:

```
curl "http://localhost:8983/solr/gettingstarted/select?wt=json&indent=true&q=foundation&fl=id"
```

To restrict search to a particular field, use the syntax ```q=field:value```, e.g. to search for Foundation only in the ```name``` field:

```
curl "http://localhost:8983/solr/gettingstarted/select?wt=json&indent=true&q=name:Foundation"
```

The above request returns only one document (```"numFound":1```) - from the response:

```
...
  "response":{"numFound":1,"start":0,"docs":[
      {
        "id":"0553293354",
        "cat":["book"],
        "name":["Foundation"],
...
```

#### Phrase search

To search for a multi-term phrase, enclose it in double quotes: ```q="multiple terms here"```. E.g. to search for "CAS latency" - note that the space between terms must be converted to "```+```" in a URL (the Admin UI will handle URL encoding for you automatically):

```
curl "http://localhost:8983/solr/gettingstarted/select?wt=json&indent=true&q=\"CAS+latency\""
```

You'll get back:
```
{
  "responseHeader":{
    "status":0,
    "QTime":25,
    "params":{
      "q":"\"CAS latency\"",
      "indent":"true",
      "wt":"json"}},
  "response":{"numFound":2,"start":0,"docs":[
      {
        "id":"TWINX2048-3200PRO",
        "name":["CORSAIR  XMS 2GB (2 x 1GB) 184-Pin DDR SDRAM Unbuffered DDR 400 (PC 3200) Dual Channel Kit System Memory - Retail"],
        "manu":["Corsair Microsystems Inc."],
        "manu_id_s":"corsair",
        "cat":["electronics",
          "memory"],
        "features":["CAS latency 2,  2-3-3-6 timing, 2.75v, unbuffered, heat-spreader"],
...
```

#### Combining searches

By default, when you search for multiple terms and/or phrases in a single query, Solr will only require that one of them is present in order for a document to match. Documents containing more terms will be sorted higher in the results list.

You can require that a term or phrase is present by prefixing it with a "```+```"; conversely, to disallow the presence of a term or phrase, prefix it with a "```-```".

To find documents that contain both terms "```apple```" and "```ipod```", enter ```+apple``` ```+ipod``` in the ```q``` param in the Admin UI Query tab. Because the "```+```" character has a reserved purpose in URLs (encoding the space character), you must URL encode it for ```curl``` as "```%2B```":

```
curl "http://localhost:8983/solr/gettingstarted/select?wt=json&indent=true&q=%2Bapple+%2Bipod"
```

To search for documents that contain the term "```apple```" but don't contain the term "```ipod```", enter ```+apple``` ```-ipod``` in the ```q``` param in the Admin UI. Again, URL encode "```+```" as "```%2B```":

```
curl "http://localhost:8983/solr/gettingstarted/select?wt=json&indent=true&q=%2Bapple+-ipod"
```

#### In depth

For more Solr search options, see the Solr Reference Guide's Searching section: https://cwiki.apache.org/confluence/display/solr/Searching


### Faceting

One of Solr's most popular features is faceting. Faceting allows the search results to be arranged into subsets (or buckets or categories), providing a count for each subset. There are several types of faceting: field values, numeric and date ranges, pivots (decision tree), and arbitrary query faceting.

#### Field facets

In addition to providing search results, a Solr query can return the number of documents that contain each unique value in the whole result set.

From the core-specific Admin UI Query tab, if you check the ```"facet"``` checkbox, you'll see a few facet-related options appear.

To see facet counts from all documents (```q=*:*```): turn on faceting (```facet=true```), and specify the field to facet on via the ```facet.field``` param. If you only want facets, and no document contents, specify ```rows=0```. The ```curl``` command below will return facet counts for the ```manu_id_s``` field:

```
curl 'http://localhost:8983/solr/gettingstarted/select?wt=json&indent=true&q=*:*&rows=0'\
'&facet=true&facet.field=manu_id_s'
```

In your terminal, you'll see:

```
{
  "responseHeader":{
    "status":0,
    "QTime":5,
    "params":{
      "q":"*:*",
      "facet.field":"manu_id_s",
      "indent":"true",
      "rows":"0",
      "wt":"json",
      "facet":"true"}},
  "response":{"numFound":49,"start":0,"docs":[]
  },
  "facet_counts":{
    "facet_queries":{},
    "facet_fields":{
      "manu_id_s":[
        "corsair",3,
        "belkin",2,
        "canon",2,
        "apple",1,
        "asus",1,
        "ati",1,
        "boa",1,
        "dell",1,
        "eu",1,
        "maxtor",1,
        "nor",1,
        "uk",1,
        "viewsonic",1,
        "samsung",0]},
    "facet_ranges":{},
    "facet_intervals":{},
    "facet_heatmaps":{}}}
```

#### Range facets

For numerics or dates, it's often desirable to partition the facet counts into ranges rather than discrete values. A prime example of numeric range faceting, using the example product data, is ```price```. The data for these price range facets can be seen in JSON format with this command:

```
curl 'http://localhost:8983/solr/gettingstarted/select?q=*:*&wt=json&indent=on&rows=0'\
'&facet=true'\
'&facet.range=price'\
'&f.price.facet.range.start=0'\
'&f.price.facet.range.end=600'\
'&f.price.facet.range.gap=50'\
'&facet.range.other=after'
```

In your terminal you will see:

```
{
  "responseHeader":{
    "status":0,
    "QTime":41,
    "params":{
      "facet.range":"price",
      "q":"*:*",
      "f.price.facet.range.start":"0",
      "facet.range.other":"after",
      "indent":"on",
      "f.price.facet.range.gap":"50",
      "rows":"0",
      "wt":"json",
      "facet":"true",
      "f.price.facet.range.end":"600"}},
  "response":{"numFound":49,"start":0,"docs":[]
  },
  "facet_counts":{
    "facet_queries":{},
    "facet_fields":{},
    "facet_ranges":{
      "price":{
        "counts":[
          "0.0",19,
          "50.0",1,
          "100.0",0,
          "150.0",2,
          "200.0",0,
          "250.0",1,
          "300.0",1,
          "350.0",2,
          "400.0",0,
          "450.0",1,
          "500.0",0,
          "550.0",0],
        "gap":50.0,
        "after":2,
        "start":0.0,
        "end":600.0}},
    "facet_intervals":{},
    "facet_heatmaps":{}}}
```

#### Pivot facets

Another faceting type is pivot facets, also known as "decision trees", allowing two or more fields to be nested for all the various possible combinations. Using the example technical product data, pivot facets can be used to see how many of the products in the "book" category (the cat field) are in stock or not in stock. Here's how to get at the raw data for this scenario:

```
curl 'http://localhost:8983/solr/gettingstarted/select?q=*:*&rows=0&wt=json&indent=on'\
'&facet=on&facet.pivot=cat,inStock'
```

This results in the following response (trimmed to just the book category output), which says out of 14 items in the "book" category, 12 are in stock and 2 are not in stock:

```
...
"facet_pivot":{
  "cat,inStock":[{
      "field":"cat",
      "value":"book",
      "count":14,
      "pivot":[{
          "field":"inStock",
          "value":true,
          "count":12},
        {
          "field":"inStock",
          "value":false,
          "count":2}]},
...
```

#### More faceting options

For the full scoop on Solr faceting, visit the Solr Reference Guide's Faceting section: https://cwiki.apache.org/confluence/display/solr/Faceting