# 3.3 Übung: Etwas über das System herausfinden


## Aufgaben zu Linux-Kommandos
Welche Linux-Kommandos liefern die Antworten auf die folgenden Fragen? Ein Teil der benötigten Kommandos findet sich auf dem im vorigen Kapitel erwähnten [Cheatsheet](http://cheatsheetworld.com/programming/unix-linux-cheat-sheet/). Weitere Antworten finden sich über Suchen im Internet. Meist reicht es an die passenden Suchbegriffe das Wort "linux" mit anzuhängen.

### 1. Wieviel Arbeitsspeicher ist auf dem System frei?

Lösung: {%s%}free -h{%ends%}

### 2. Wieviel Festplattenspeicher ist auf dem System frei?
Lösung: {%s%}df -H{%ends%}

### 3. Welche(r) Prozessor(en) stehen dem System zur Verfügung?
Lösung: {%s%}lscpu{%ends%}

### 4. Welches Betriebssystem (a), in welcher Version (b) und mit welchem Linux-Kernel (c) ist installiert?
Lösung:
* (a) {%s%}cat /etc/issue{%ends%}
* (b) {%s%}cat /etc/debian_version{%ends%}
* (c) {%s%}uname -r{%ends%}

### 5. Wer ist gerade auf dem System angemeldet?
Lösung: {%s%}w{%ends%}

### 6. Welche Pakete sind auf dem System installiert?
Lösung: {%s%}dpkg -l{%ends%}

### 7. Welche Prozesse laufen derzeit auf dem System?
Lösung:
* {%s%}top{%ends%}
* {%s%}ps -e{%ends%}

### 8. Welche Netzwerkverbindungen sind gerade aktiv?
Lösung:
* {%s%}netstat -i{%ends%}
* {%s%}netstat -r{%ends%}