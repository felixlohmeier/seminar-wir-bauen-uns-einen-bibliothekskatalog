# 3.1 Installation der Systemumgebung

Im Seminar an der HAW Hamburg verwenden wir vorinstallierte Linux-Webserver, welche die Hochschule bereitstellt. Wer dieses Skript außerhalb des Seminars nachspielen möchte, muss sich zunächst einen Linux-Webserver auf dem eigenen Rechner installieren. Das funktioniert am einfachsten und am sichersten mit einer Virtualisierungssoftware wie [VirtualBox oder VMware](http://www.pc-magazin.de/vergleich/vmware-virtualbox-virtualisierung-tool-test-gratis-kostenlos-2827888.html) und ist in etwa 60 Minuten erledigt.

**Systemvoraussetzungen:**
* Computer mit Windows, Mac oder Linux
* mindestens 1 GB freien Arbeitsspeicher für die virtuelle Maschine
* 20 GB freien Speicher auf der Festplatte
* einigermaßen aktuelle CPU mit [Hardware-Unterstützung für Virtualisierung](http://www.sysprobs.com/disable-enable-virtualization-technology-bios) (Intel VT-X, AMD-V)

## Schritt 1: VirtualBox installieren

Laden Sie die Installationsdatei für ihr Betriebssystem unter https://www.virtualbox.org/wiki/Downloads und folgen Sie den Anweisungen des Installationsprogramms.

Eine Einführung in das Programm bietet das offizielle Handbuch (in englisch): https://www.virtualbox.org/manual/ch01.html

VirtualBox ermöglicht es Ihnen auf ihrem gewohnten Betriebssystem (Windows, Mac, Linux) beliebige weitere Gast-Betriebssysteme zu installieren und parallel auszuführen. Die Gast-Betriebssysteme laufen in einer gesicherten, virtuellen Arbeitsumgebung. So können sie lokal einen virtuellen Linux-Webserver auf ihrem Computer installieren und bei Bedarf starten.

## Schritt 2: Virtuelle Maschine einrichten

Normalerweise würden Sie das gewünschte Linux von der offiziellen Webseite herunterladen, eine virtuelle Maschine in Virtualbox einrichten, das Linux installieren und anschließend als Webserver konfigurieren. Um diesen Vorgang zu vereinfachen, können Sie auch eine vorgefertigte virtuelle Maschine aus dem Internet herunterladen. Wie immer gilt dabei, dass Sie dem Anbieter vertrauen müssen, denn er könnte böswillige Änderungen an dem Linux vorgenommen haben. Ein etablierter Anbieter von virtuellen Maschinen (dort "Appliances" genannt) ist [TurnKey Linux](https://www.turnkeylinux.org/). Dort gibt es zahlreiche vorkonfigurierte Webserver zum Download in verschiedenen Formaten, unter anderem für VirtualBox.

In den Übungen in diesem Skript verwenden wir [Debian](https://de.wikipedia.org/wiki/Debian). Das ist ein Linux, das häufig auf Webservern eingesetzt wird. Die entsprechende Appliance bei Turnkey Linux heißt [Turnkey Core](https://www.turnkeylinux.org/core).

### 1. Download von TurnKey Core

Laden Sie die Version für virtuelle Maschinen ("VM build") von der Turnkey-Linux-Webseite herunter. Direktlink zu Version 14.1: https://www.turnkeylinux.org/download?file=turnkey-core-14.1-jessie-amd64.ova

### 2. Starten Sie VirtualBox und importieren Sie die Appliance

1. Menü Datei / Appliance importieren... auswählen
2. Heruntergeladene Datei auswählen
3. Doppelklick auf "Gast-Betriebssystem" und Linux / Debian (64-bit) auswählen
4. Button "Importieren" drücken

### 3. Netzwerk einrichten

Öffnen Sie zunächst die allgemeinen Einstellungen (Menü Datei / Einstellungen) und navigieren Sie zu Netzwerk / "Host-only-Netzwerke". Klicken Sie dort auf den Button rechts mit dem Plus-Symbol, um ein Netzwerk anzulegen.

Klicken Sie anschließend auf den Button "Ändern", um die Einstellungen der virtuellen Maschine aufzurufen. Konfigurieren Sie dort in der Rubrik Netzwerk zwei Netzwerkadapter:

* Adapter 1: Angeschlossen an: Host-only Adapter
* Adapter 2: Angeschlossen an: NAT

Der erste Netzwerkadapter ermöglicht Ihnen, von Ihrem Betriebssystem auf die virtuelle Maschine zuzugreifen. Der zweite Netzwerkadapter erlaubt der virtuellen Maschine ihre Internetverbindung mitzubenutzen.

### 4. Weitere Einstellungen

Nehmen Sie weitere Einstellungen vor, die Sie zu Ihrem Computer passen. Empfehlungen:

* Allgemein/Name: Vergeben Sie einen individuellen Namen
* System/Hauptplatine/Hauptspeicher: Erhöhen Sie den Arbeitsspeicher, wenn Ihr Computer ausreichend freien Arbeitsspeicher zur Verfügung hat. Achtung: In der Regel sollten Sie nicht mehr als die Hälfte des verfügbaren Arbeitsspeichers vergeben, da sonst ggf. nicht mehr genug Speicher für Ihr "normales" Betriebssystem verbleibt! Die Übungen im Kapitel 7 dieses Skripts sind für virtuelle Maschinen mit 4096 MB RAM ausgelegt. Wenn Sie weniger Arbeitsspeicher zuteilen können, dann müssen Sie im Kapitel 7 die Übungen später etwas abwandeln und weniger Daten verarbeiten. Mindestens 1024 MB sollten es aber sein.
* System/Prozessor/Prozessoren: Auch hier gilt: Je mehr CPUs desto besser, aber nicht mehr als die Hälfte der insgesamt verfügbaren CPUs.

### 5. Booten Sie die virtuelle Maschine in VirtualBox

Klicken Sie auf "Start", es öffnet sich ein neues Fenster, in dem der Startvorgang durchläuft (etwa 1 Minute). Dann erscheint ein Bildschirm mit Dialogen:

* Vergeben Sie ein Passwort (bitte nur aus Buchstaben und Zahlen, wir ändern es später).
* Die "Hub Services" von TurnKey können Sie überspringen (mit der Tab-Taste können Sie auf "Skip" wechseln).
* Die E-Mail-Benachrichtigungen sind sinnvoll, können aber auch übersprungen werden (falls Sie sich registrieren wollen, aber Probleme haben, die @-Taste zu finden... auf der voreingestellten englischen Tastatur ist es: ```AltGr``` und ```2```).
* Die Sicherheitsupdates sollten Sie sofort installieren (und den Neustart bestätigen, wenn Sie dazu aufgefordert werden).

Nach erfolgtem Neustart bekommen Sie die Adressen angezeigt, unter denen die virtuelle Maschine in Ihrem Netzwerk erreichbar ist. TurnKey Linux bringt eine Administrationsoberfläche und eine Kommandozeile mit, die Sie über den Browser auf Ihrem Computer aufrufen können. Notieren Sie sich die Angaben oder machen Sie einen Screenshot (Menü View / Take Screenshot).

Wenn der Mauszeiger verschwunden sein sollte, müssen Sie ggf. eine Taste drücken, die unten rechts in der Fußzeile des Fensters angezeigt wird. Diese Taste (z.B. STRG rechts) hebt den Fokus auf das Fenster der virtuellen Maschine wieder auf, so dass Sie normal in Ihrem Betriebssystem navigieren können.

Solange das Fenster offen ist, läuft die virtuelle Maschine. Zum Beenden der virtuellen Maschine schließen Sie einfach das Fenster und wählen Sie die zweite Option "Send the shutdown signal". Um die virtuelle Maschine erneut zu starten, wählen Sie den "Start" Button in Virtualbox. Sobald der bekannte Bildschirm mit den Adressen erscheint, ist die virtuelle Maschine erreichbar.

## Schritt 3: Systemkonfiguration

Wechseln Sie mit Enter in das "Advanced Menu" und wählen Sie dort den Menüpunkt "Quit" aus. Anschließend melden Sie sich an:

* core login: ```root```
* Password: (von Ihnen während der Installation festgelegt)

Geben Sie dann folgende Befehle ein:

### 1. Tastaturlayout anpassen

    apt-get install console-data console-setup

Es ist eine englische Tastatur voreingestellt, daher ist der Bindestrich an ungewohnter Stelle. Bei Ihrer Tastatur vermutlich auf der Taste des Fragezeichens (```?```). Nach Eingabe des Befehls müssen Sie den Download noch mit ```y``` (vermutlich ```z``` auf der Tastatur) bestätigen. Im Auswahlmenü wählen Sie dann "Other" (ganz unten), dann "German" und nochmal "German" (ganz oben). Danach sollte die Tastatur wie gewohnt funktionieren.

### 2. Root-Passwort ändern

Da im Installationsbildschirm die englische Tastatur voreingestellt war, wäre es schwierig gewesen, ein komplexeres Passwort einzugeben. Setzen Sie jetzt ein komplexes Passwort mit mindestens 16 Zeichen und Sonderzeichen.

1. Sicheres Passwort unter http://passwordsgenerator.net generieren (Empfehlung: Checkbox "Exclude Ambiguous Characters" aktivieren, das macht es später leichter das Passwort einzutippen)
2. Passwort setzen mit dem Befehl ```passwd```

### 3. Neuen Benutzer einrichten

Aus Sicherheitsgründen sollte nicht mit dem Benutzer ```root``` gearbeitet werden, weil dieser uneingeschränkte Berechtigungen auf dem System hat. Wir richten daher einen neuen Nutzer ein:

    adduser stud

Sie werden dann aufgefordert ein Passwort zu vergeben. Die Abfragen nach weiteren Informationen können Sie jeweils leer lassen und mit ENTER bestätigen.

Für die Übungen im Skript werden später manchmal Administrator-Berechtigungen benötigt, daher installieren wir das Paket [sudo](https://wiki.ubuntuusers.de/sudo/) und fügen den gerade hinzugefügten Nutzer der Gruppe der Administratoren hinzu.

    apt-get install sudo
    adduser stud sudo


### 4. Neustart

    reboot

Sobald der Server neu gestartet ist (etwa 30 Sekunden), erscheint wieder der Empfangsbildschirm mit den Internetadressen. Sie können jetzt mit Kapitel 3.2 fortfahren. Verwenden Sie für die folgenden Aufgaben immer den Nutzer ``stud```.