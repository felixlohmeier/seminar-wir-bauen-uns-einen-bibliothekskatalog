# 7.9 Automatisierung

Die Systemarchitektur von OpenRefine macht es möglich, die Anwendung nicht nur über die grafische Oberfläche, sondern auch über eine API "fernzusteuern". Im Punkt zur Systemarchitektur in der [Dokumentation für Entwickler](https://github.com/OpenRefine/OpenRefine/wiki/Documentation-For-Developers) heißt es:

>"And it's possible to make the server-side scriptable from the command line."

Das machen wir uns zunutze. Die [HTTP-API von OpenRefine](https://github.com/OpenRefine/OpenRefine/wiki/OpenRefine-API) kann theoretisch auch direkt angesprochen werden, aber da sie nur rudimentär dokumentiert ist, nutzen wir einen der verschiedenen Clients, die andere schon für OpenRefine entwickelt haben. Es gibt Clients in Python, Ruby, node.js, PHP und für R. Am ausgereiftesten ist der [Python-Client von Paul Makepeace](https://github.com/PaulMakepeace/refine-client-py/).

Der Client kann ebenso wie OpenRefine lokal installiert werden. Um die Installation und Bedienung zu vereinfachen, habe ich einen Docker-Container gebaut (vgl. [Repository felixlohmeier/openrefine in Docker Hub](https://hub.docker.com/r/felixlohmeier/openrefine/)).

## Aufgabe 1: Starten Sie den Python-Client und geben Sie eine Liste der Projekte aus

Hinweise:

* Die Bedienung ist im Abschnitt "**batch processing with python-client**" im [Repository in Docker Hub](https://hub.docker.com/r/felixlohmeier/openrefine/)) beschrieben. Schauen Sie sich die dort gelisteten Docker-Startbefehle an und wandeln Sie diese so ab, dass diese mit dem in [Kapitel 6.3](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/06_3_openrefine_starten_und_daten_laden.html) beschriebenen Docker-Startbefehl zusammen passen.

## Lösung

* Server starten: {%s%}sudo docker run --name=refine-server --rm -p 8888:3333 -v /home/stud/refine:/data felixlohmeier/openrefine:2.6rc1 -i 0.0.0.0 -m 3G -d /data{%ends%}
* Python-Client starten: {%s%}sudo docker run --link refine-server --rm -v /home/stud/refine:/data felixlohmeier/openrefine:client-py{%ends%}

## Aufgabe 2: Wenden Sie die in Kap. 7.3 gespeicherten Transformationsregeln auf ein neues Projekt an

Hinweise:

* Erstellen Sie ein neues Projekt auf gewohnte Weise (vgl. [Kapitel 6.3](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/06_3_openrefine_starten_und_daten_laden.html), Aufgabe 2)
* Nutzen Sie entweder Ihre selbst gespeicherten Transformationsregeln aus [Kapitel 7.3](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/07_3_fuer_jedes_marc-feld_eine_spalte.html) oder die aus der Datei [07_3.json](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/openrefine/07_3.json). Speichern Sie die Transformationsregeln in einer Datei auf dem Webserver, z.B. mit ```nano``` (vgl. [Kapitel 3.5](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/03_5_uebung_text_ueber_die_konsole_erstellen.html)) oder laden Sie die Datei mit ```curl``` (vgl. [Kapitel 4.2](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/04_2_uebung_unapi-schnittstelle_des_gbv.html).

## Lösung

...

## Aufgabe 3: Exportieren Sie mit dem Python-Client die Daten aus einem Projekt als TSV

Hinweise:

* Auch der dafür notwendige Befehl ist im [Repository in Docker Hub](https://hub.docker.com/r/felixlohmeier/openrefine/)) beschrieben.

## Lösung

..


## Aufgabe 4: Schreiben Sie ein Shell-Script, dass Server und Client startet, die Transformation durchführt und dann die Daten als TSV exportiert

Hinweise:

* Schauen Sie sich die Grundlagen für Shell-Scripte in [Kapitel 4.4](https://felixlohmeier.gitbooks.io/seminar-wir-bauen-uns-einen-bibliothekskatalog/content/04_4_download_der_metadaten.html), Aufgabe 3 nochmal an.
* Der Docker-Container mit dem Server muss vollständig gestartet sein, bevor Sie den Client starten können. Daher sollten Sie eine gewisse Wartezeit einbauen, z.B. mit dem Befehl ```sleep 15```
* Verwenden Sie ein neues Projekt für Ihre Tests. Wenn Sie Transformationsregeln ein zweites Mal auf ein Projekt anwenden, dann laufen die Transformationen auf den bereits transformierten Daten ab. Das führt bestimmt zu unerwünschten Ergebnissen.

## Lösung

...

## Literatur

* Die [FAQ aus der OpenRefine Dokumentation](https://github.com/OpenRefine/OpenRefine/wiki/FAQ) behandeln auch, wie OpenRefine programmatisch als Server genutzt werden kann.