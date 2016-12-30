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

### 2. Starten Sie VirtualBox und folgen Sie der Installationsanleitung von TurnKey Linux

(vgl. Schritt 3a unter https://www.turnkeylinux.org/docs/installation-appliances-virtualbox-new)

    If you've downloaded the default VM build:
    1. Under the File menu, select Import Appliance.
    2. Direct the file browser to the OVA file.
    3. Double click Guest OS Type and select Linux > Ubuntu
    4. Press Import to create the VM.

Die folgenden Einstellungen aus der Installationsanleitung nur vornehmen, wenn Sie nicht bereits vorausgewählt sind:

    After you've created the new VM, you'll need to tweak its configuration:
    1. Settings > System > Processor > Enable PAE/NX
    2. Settings > Network > Adapter 1 > Attach to: bridged

Die letzte Einstellung verbindet die virtuelle Maschine über eine "Bridge" mit der Netzwerkverbindung Ihres Computers. Wenn Sie mehrere Netzwerkadapter (z.B. WLAN und Ethernet) haben, dann wählen Sie einen aus. Die Einstellung lässt sich später ändern. Ihr Computer muss per WLAN oder Kabel mit einem lokalen Netzwerk (in der Regel Ihr WLAN-Router zuhause) verbunden sein, bevor Sie fortfahren.

Nehmen Sie weitere Einstellungen vor, die Sie zu Ihrem Computer passen. Empfehlungen:

* General/Name: Vergeben Sie einen individuellen Namen
* System/Motherboard/Base Memory: Erhöhen Sie den Arbeitsspeicher, wenn Ihr Computer ausreichend freien Arbeitsspeicher zur Verfügung hat. Achtung: In der Regel sollten Sie nicht mehr als die Hälfte des verfügbaren Arbeitsspeichers vergeben, da sonst ggf. nicht mehr genug Speicher für Ihr "normales" Betriebssystem verbleibt! Die Übungen im Kapitel 7 dieses Skripts sind für virtuelle Maschinen mit 4096 MB RAM ausgelegt. Wenn Sie weniger Arbeitsspeicher zuteilen können, dann müssen Sie im Kapitel 7 die Übungen später etwas abwandeln und weniger Daten verarbeiten. Mindestens 1024 MB sollten es aber sein.
* System/Motherboard/Processor(s): Auch hier gilt: Je mehr CPUs desto besser, aber nicht mehr als die Hälfte der insgesamt verfügbaren CPUs.

### 3. Booten Sie die virtuelle Maschine in VirtualBox

Klicken Sie auf "Start", es öffnet sich ein neues Fenster, in dem der Startvorgang durchläuft (etwa 1 Minute). Dann erscheint ein Bildschirm mit Dialogen:

* Vergeben Sie ein Passwort.
* Die "Hub Services" von TurnKey können Sie überspringen (mit der Tab-Taste können Sie auf "Skip" wechseln).
* Die E-Mail-Benachrichtigungen sind sinnvoll, können aber auch übersprungen werden (falls Sie sich registrieren wollen, aber Probleme haben, die @-Taste zu finden... auf einer englischen Tastatur ist es: ```AltGr``` und ```2```).
* Die Sicherheitsupdates sollten Sie sofort installieren (und den Neustart bestätigen, wenn Sie dazu aufgefordert werden).

Nach erfolgtem Neustart bekommen Sie die Adressen angezeigt, unter denen die virtuelle Maschine in Ihrem Netzwerk erreichbar ist. TurnKey Linux bringt eine Administrationsoberfläche und eine Kommandozeile mit, die Sie über den Browser auf Ihrem Computer aufrufen können. Notieren Sie sich die Angaben oder machen Sie einen Screenshot (Menü View / Take Screenshot).

Wenn der Mauszeiger verschwunden sein sollte, müssen Sie ggf. eine Taste drücken, die unten rechts in der Fußzeile des Fensters angezeigt wird. Diese Taste (z.B. STRG rechts) hebt den Fokus auf dieses Fenster wieder auf, so dass Sie normal in Ihrem Betriebssystem navigieren können.

Solange das Fenster offen ist, läuft die virtuelle Maschine. Zum Beenden der virtuellen Maschine schließen Sie einfach das Fenster und wählen Sie die zweite Option "Send the shutdown signal". Um die virtuelle Maschine erneut zu starten, wählen Sie den "Start" Button in Virtualbox. Sobald der bekannte Bildschirm mit den Adressen erscheint, ist die virtuelle Maschine erreichbar.

## Schritt 3: Systemkonfiguration

Rufen Sie die Web Shell im Browser auf:

    https://192.168.1.1:12320

Die IP-Adresse 192.168.1.1 durch die Adresse Ihres Webservers ersetzen und Warnmeldungen zum SSL-Zertifikat ignorieren bzw. eine Ausnahmeregelung einrichten.

Login mit ```root``` und dem von Ihnen während der Installation festgelegten Root-Passwort. Geben Sie dann folgende Befehle ein:

### 1. Tastaturlayout anpassen

    apt-get install console-data console-setup

Im Auswahlmenü "Other", dann "German" und nochmal "German" auswählen.

### 2. Neuen Benutzer einrichten

Aus Sicherheitsgründen sollte nicht mit dem Benutzer ```root``` gearbeitet werden, weil dieser uneingeschränkte Berechtigungen auf dem System hat. Wir richten daher einen neuen Nutzer ein:

    adduser name

```name``` durch einen Namen ihrer Wahl ersetzen (ein Wort und besser in Kleinschreibung). Sie werden dann aufgefordert ein Passwort zu vergeben. Die Abfragen nach weiteren Informationen können Sie jeweils leer lassen und mit ENTER bestätigen.

Für die Übungen im Skript werden später manchmal Administrator-Berechtigungen benötigt, daher installieren wir das Paket [sudo](https://wiki.ubuntuusers.de/sudo/) und fügen den gerade hinzugefügten Nutzer der Gruppe der Administratoren hinzu.

    apt-get install sudo
    adduser name sudo

```name``` wieder durch den gewählten Namen ersetzen.


### 3. Neustart

    reboot

Sobald der Server neu gestartet ist (etwa 30 Sekunden), sollte ein "Connect" Button in der Web Shell erscheinen, mit dem eine neue Verbindung hergestellt werden kann. Jetzt kann der Login mit dem gerade neu angelegten Benutzer erfolgen und es sollte das neue Tastaturlayout eingestellt sein (Test z.B. mit @-Taste). Die Verbindung der Web Shell beenden Sie mit dem Befehl ```exit```.