# Ersti-Info

[![Build Status](https://travis-ci.org/FachschaftMathPhysInfo/Ersti-Info.svg?branch=master)](https://travis-ci.org/FachschaftMathPhysInfo/Ersti-Info)

Das Ersti-Info ist eine Broschüre der Fachschaften Informatik, Mathematik und Physik, die jedes Jahr
am Anfang des Semesters allen neuen Studierenden ausgehändigt wird. Es

- begleitet den Vorkurs
- sorgt dafür, dass Erstis nicht mit allen Fragen zu uns kommen
- beschreibt das Studium in Heidelberg
- informiert über Hochschulpolitik
- erklärt die Stadt
- und ist super awesome :))

## Struktur

Das Ersti-Info besteht wie jedes größere LaTex-Dokument aus vielen Einzeldateien, die in `ersti.tex` zusammengeführt werden.
Diese Datei ist also quasi die "Hauptdatei", in der die grundlegende Struktur und die Kapitel festgelegt sind.

Um die Übersichtlichkeit im Verzeichnis zu behalten, sind die einzelnen Artikel in Unterverzeichnissen
nach Kapitel sortiert (und hoffentlich sinnvoll benannt ;). Besonders wichtig ist hier das `zu_aktualisieren`-Verzeichnis,
in dem viele sich oft ändernde Dinge mit Aliasen benannt wird, um sie an einem zentralen Ort aktualisieren können.

Neben dem `ersti.tex` Dokument wird in `mantelbogen.tex` ein eigenes Dokument für den Mantelbogen erstellt, welcher in Farbe gedruckt und deshalb gesondert behandelt wird.

Das sind im Wesentlichen auch alle Dinge, an denen man manuell als LaTeX-Amateur rumfummeln kann und will. Im [Styleguide](STYLEGUIDE.md) werden noch weitere Tipps gegeben, um einen einheitlichen Stil des Ersti-Infos zu gewährleisten.

## Kompilieren und ähnliches

Dem Ersti-Info liegt ein Makefile bei, mit dem es kompiliert werden kann. Die folgenden Befehle erzeugen
immer subtil anderen Output (auf Druck/Website/nur Inhalt optimiert)

- schnelle Vorschau - `make`
- Druck als ein PDF - `make druckzusammen`
- Druck als zwei PDFs (Mantelbogen getrennt vom Innenteil) - `make druckgetrennt`
- Webseite - `make web`
- Druck + Webseite - `make all`

Wenn die SVG-Landkarten aktualisiert wurden, empfiehlt sich ein make makeRGBreal, um auch die PDF Versionen
zu aktualisieren, die letztendlich im Ersti-Info landen. Mit `make spell` kann man die Rechtschreibprüfung
starten (die leider auch einige LaTeX Befehle überprüft).

## Vorausgesetzte Software

Um das Ersti-Info zu erstellen, wird eine TeX Distribution, wie zum Beispiel Tex Live benötigt. Zusätzlich wird folgende Software vorausgesetzt:

- svg2pdf - um SVG Datein (unter anderem die Landkarten) in PDFs umzuwandeln (eine binary liegt im repo)
- ghostscript - um das Farbprofil von PDFs von RGB in CMYK umzuwandeln
- pdftk - um in der Webversion Mantelbogen und Inhalt miteinander zu verschmelzen
- python - um die Metadaten für das Inhaltsverzeichnis richtig zu erzeugen
- make - um alle make Befehle auszuführen

## Landkarten aktualisieren

Die Landkarten vom Neuenheimer Feld und des Philowegs basieren auf Exporten von [Open Street Map](https://www.openstreetmap.org). Dort kann man unter "Teilen" einen Bildausschnitt festlegen und diesen dann als PDF oder SVG herunterladen. Ein Maßstab von `1:2000` ist geeignet. Die PDF oder SVG kann dann mit Inkscape geöffnet werden, um unwichtige Details zu entfernen und Markierungen der relevanten Gebäude einzufügen. Es kann sein, dass `svg2pdf` beim Umwandeln die Kartenbeschriftungen kaputt macht, dann muss man die PDF selber exportieren. Beim Einfärben wurden die Gebäude bisher mit der Farbe `#ff6666` eingefärbt und mit einem Schriftlabel der Schriftart `DejaVu Sans` versehen. Es ist darauf zu achten, dass hinter der schwarzen Schrift noch einmal derselbe Text, aber mit deutlich dickerer Kontour in weiß gedruckt wird, damit dieser sich insgesamt von der Karte ordentlich abhebt.

## Checkliste für den Druck

Bevor man die Dokumente `druck_inhalt.pdf` und `druck_mantel.pdf` in Druck gibt, sollte man auf folgende Punkte achten:

- Ist der Inhaltsteil in Graustufen, abgesehen von der Sonderfarbe (momentan grün) in den Überschriften?
- Sind alle Grafiken ins CMYK Farbprofil umgewandelt und somit für den Druck optimiert?
- Ist eine Beschnittzugabe von 3mm beim Cover hinzugefügt worden, sodass das Dokument `216 x 303 mm` groß ist? Für die Webversion sollte das Dokument jedoch weiterhin in A4 sein, `210 x 297 mm`.
- Hat der Inhaltsteil eine Seitenanzahl, die durch 4 teilbar ist? Das sollte eigentlich automatisch passieren.
  Wenn alle diese Fragen mit Ja beantwortet werden können, dann können die Dokumente zur Druckerei geschickt werden.

## TeXnisches

Die Konfigurationsdateien `config_druck.tex` und `config_web.tex` werden beim Aufruf des jeweiligen make Befehls kopiert und als `config.tex` abgespeichert, welche dann in der `praeambel.tex` eingelesen wird.

Manchmal werden lange Wörter falsch getrennt. Diese können in `silbentrennung.tex` zum Beispiel so `\hyphenation{Übungs-grup-pen}` definiert werden, damit sie dann auch richtig getrennt werden.

In `glossar.tex` werden diverse Akronyme definiert, die dann im Dokument mit `\gls{}` aufgerufen werden können.

Damit in der Druckversion ein Dokument entsteht, was eine durch 4 teilbare Seitenanzahl hat, werden in `durch4teilbar.tex` weitere Seiten für das Dokumentenende erzeugt, wo dann drauf steht `Diese Seite ist aus technischen Gründen leer.`

## Lizenz

Diese Broschüre ist lizenziert unter einer Creative Commons
Namensnennung - Weitergabe unter gleichen Bedingungen 4.0 International
Lizenz. Der Lizenztext findet sich in der [LICENSE](https://github.com/FachschaftMathPhys/Ersti-Info/blob/master/LICENSE.md)-Datei.
