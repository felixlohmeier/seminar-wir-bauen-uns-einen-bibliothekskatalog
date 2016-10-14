# 3.1 Installation der Systemumgebung

Im Seminar an der HAW Hamburg verwenden wir vorinstallierte Linux-Webserver, welche die Hochschule bereitstellt. Wer dieses Skript außerhalb des Seminars nachspielen möchte, muss sich zunächst einen Linux-Webserver auf dem eigenen Rechner installieren. Das funktioniert am einfachsten und am sichersten mit einer Virtualisierungssoftware wie [VirtualBox oder VMware](http://www.pc-magazin.de/vergleich/vmware-virtualbox-virtualisierung-tool-test-gratis-kostenlos-2827888.html).

**Systemvoraussetzungen:**
* Computer mit Windows, Mac, Linux oder Solaris
* mindestens 1 GB freien Arbeitsspeicher für die virtuelle Maschine
* etwa 10 GB freien Speicher für die Festplatte
* einigermaßen aktuelle CPU mit [Hardware-Unterstützung für Virtualisierung](http://www.sysprobs.com/disable-enable-virtualization-technology-bios) (Intel VT-X, AMD-V)

## Schritt 1: VirtualBox installieren

Laden Sie die Installationsdatei für ihr Betriebssystem unter https://www.virtualbox.org/wiki/Downloads und folgen Sie den Anweisungen des Installationsprogramms.

Eine Einführung in das Programm bietet das offizielle Handbuch (in englisch): https://www.virtualbox.org/manual/ch01.html

VirtualBox ermöglicht es Ihnen auf ihrem gewohnten Betriebssystem (Windows, Mac, Linux) beliebige weitere Gast-Betriebssysteme zu installieren und parallel auszuführen. Die Gast-Betriebssysteme laufen in einer gesicherten, virtuellen Arbeitsumgebung. So können sie lokal einen virtuellen Linux-Webserver auf ihrem Computer installieren und bei Bedarf starten.

## Schritt 2: Virtuelle Maschine einrichten

Normalerweise würden Sie das gewünschte Linux von der offiziellen Webseite herunterladen, eine virtuelle Maschine in Virtualbox einrichten, das Linux installieren und anschließend als Webserver konfigurieren. Um diesen Vorgang zu vereinfachen, können Sie auch eine vorgefertigte virtuelle Maschine aus dem Internet herunterladen. Wie immer gilt dabei, dass Sie dem Anbieter vertrauen müssen, denn er könnte böswillige Änderungen an dem Linux vorgenommen haben. Ein etablierter Anbieter von virtuellen Maschinen (dort "Appliances" genannt) ist [TurnKey Linux](https://www.turnkeylinux.org/). Dort gibt es zahlreiche vorkonfigurierte Webserver zum Download in verschiedenen Formaten, unter anderem für VirtualBox.

In den weiteren Übungen verwenden wir [Debian](https://de.wikipedia.org/wiki/Debian). Das ist ein Linux, das häufig auf Webservern eingesetzt wird. Die entsprechende Appliance bei Turnkey Linux heißt [Turnkey Core](https://www.turnkeylinux.org/core).

1. Download von TurnKey Core: Laden Sie die Version für virtuelle Maschinen ("VM build") von der Turnkey-Linux-Webseite herunter: https://www.turnkeylinux.org/download?file=turnkey-core-14.1-jessie-amd64.ova
2. Starten Sie VirtualBox und folgen Sie der Installationsanleitung von TurnKey Linux: https://www.turnkeylinux.org/docs/installation-appliances-virtualbox-new (nur Schritt 3a)
3. Booten Sie die virtuelle Maschine in VirtualBox. Sie werden aufgefordert, ein Passwort zu vergeben und bekommen dann die IP-Adresse des Webservers angezeigt.

TurnKey Linux bringt eine Administrationsoberfläche und eine Kommandozeile mit, die Sie über den Browser aufrufen können:

    https://12.34.56.789:12321/ - System control panel
    https://12.34.56.789:12320/ - Web based command line terminal

Die *12.34.56.789* müssen Sie durch die IP-Adresse ihres Webservers ersetzen, die beim Start angezeigt wurde. Warnmeldungen des Browsers zu ungültigen SSL-Zertifikaten bitte ignorieren bzw. eine Ausnahmeregelung einrichten.