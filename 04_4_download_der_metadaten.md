# 4.4 Download der Metadaten

XML-Formate lassen sich leichter vergleichen
Umwandlung PP in PICAXML und MARC21 in MARCXML ist verlustfrei

Kopie in die Zwischenablage in Putty:
"PuTTY's copy and paste works entirely with the mouse. In order to copy text to the clipboard, you just click the left mouse button in the terminal window, and drag to select text. When you let go of the button, the text is automatically copied to the clipboard."
siehe http://the.earth.li/~sgtatham/putty/0.52/htmldoc/Chapter3.html#3.1.1

PPN: 834422018
https://kataloge.uni-hamburg.de/DB=2/XMLPRS=N/PPN?PPN=834422018

curl -s => silent
sed 's/^ *//'  => left trim
sed 's/ *$//'  => right trim
sed '/^$/d'    => remove empty line
sed 's/--/\n/g' => break -- (marcxml)
sed 's/^*// => einleitendes Sternchen entfernen (isbd)
sort => 
uniq => 

XPATH ODER SED?
s/<[^>]*>//g'
xpath -q -e "string(*)"

picaxml
curl -s "http://unapi.gbv.de/?id=opac-de-18-302:ppn:834422018&format=picaxml" | sed 's/^ *//; s/ *$//; /^$/d; s/<[^>]*>//g' | sort | uniq > 834422018.picaxml.strip

marcxml
curl -s "http://unapi.gbv.de/?id=opac-de-18-302:ppn:834422018&format=marcxml" | sed 's/--/\n/g' | sed 's/^ *//; s/ *$//; /^$/d; s/<[^>]*>//g' | sort | uniq > 834422018.marcxml.strip

dc
curl -s "http://unapi.gbv.de/?id=opac-de-18-302:ppn:834422018&format=dc" | sed 's/^ *//; s/ *$//; /^$/d; s/<[^>]*>//g' | sort | uniq > 834422018.dc.strip

mods
curl -s "http://unapi.gbv.de/?id=opac-de-18-302:ppn:834422018&format=mods" | sed 's/^ *//; s/ *$//; /^$/d; s/<[^>]*>//g' | sort | uniq > 834422018.mods.strip

isbd
curl -s "http://unapi.gbv.de/?id=opac-de-18-302:ppn:834422018&format=isbd" | sed 's/^*//; /^$/d' | sort | uniq > 834422018.isbd.strip

diff -u 834422018.picaxml.strip 834422018.marcxml.strip
diff -u 834422018.picaxml.strip 834422018.dc.strip
diff -u 834422018.picaxml.strip 834422018.mods.strip

vimdiff 834422018.picaxml.strip 834422018.marcxml.strip
vimdiff 834422018.picaxml.strip 834422018.dc.strip
vimdiff 834422018.picaxml.strip 834422018.mods.strip
(Beenden mit zweimal :q <enter>)

Suche nach Begriffen aus Katalogeintrag:
https://kataloge.uni-hamburg.de/DB=2/XMLPRS=N/PPN?PPN=834422018
Im Ordner mit den Dateien ausführen
grep -i -n -H "Lehrbuch" 834422018*