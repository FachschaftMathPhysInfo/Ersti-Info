# svg2pdf konvertiert die SVGs in PDFs und behält das Vektorformat bei.
# Das hält die Größe in Grenzen und lässt sich beliebig zoomen, ideal
# für's Internet. Die Farben sind allerdings in RGB und daher ungeeignet
# zum Drucken.
# Das Programm gibt es hier:
# http://wiki.inkscape.org/wiki/index.php/Tools#svg2pdf
# Eine für Debian kompilierte Version findet sich im Hauptverzeichnis

# Convert ist das Kommandozeilentool von Imagemagick und konvertiert die
# PDFs in ein Rasterformat, dafür allerdings mit CMYK Farben, so wie es
# für den Druck benötigt wird. Die Dateigröße steigt dadurch erheblich an
# weswegen diese Dateien nur zum Druck geeignet sind.


MODERNTEX := /home/jasper/texlive/2009/bin/x86_64-linux/
PATH := ${MODERNTEX}:${PATH}
SHELL := /bin/bash


fast: clean
	@echo -e "Erstelle nur schnell den Inhalt neu. Für ein komplettes PDF nutze eins der folgenden:\nmake web\nmake druck\nmake all\n\n"
	@cp config_web.tex config.tex
	@make --no-print-directory inhalt
	@mv ersti.pdf vorschau_inhalt.pdf
	@make --no-print-directory clean
	@echo -e "\v\v\v\v\vFolgende Dateien wurden erstellt:\nvorschau_inhalt.pdf\t\tEnthält nur den Inhalt. Nicht zur Herausgabe gedacht."

web: clean
	@echo "Erstelle Web-Variante des Erstiinfos…"
	@cp config_web.tex config.tex
	@make --no-print-directory makeGIT
	@make --no-print-directory makeRGBreal
	@make --no-print-directory mantel
	@make --no-print-directory inhalt
	@echo "Verklebe Inhalt und Mantelbogen…"
	@pdftk mantelbogen.pdf cat 1-2 3W 4 output mantelbogen_web.pdf > /dev/null
	@pdftk C=ersti.pdf M=mantelbogen_web.pdf cat M1-2 C M3-4 output webseite.pdf  > /dev/null
	@make --no-print-directory clean
	@echo -e "\v\v\v\v\vFolgende Dateien wurden erstellt:\nwebseite.pdf\t\tEnthält Cover und Inhalt in einem PDF, Grafiken sind als Vektoren eingebunden, RGB Format"


druck: clean
	@echo "Erstelle Druck-Variante des Erstiinfos…"
	@cp config_druck.tex config.tex
	@make --no-print-directory makeGIT
	@make --no-print-directory makeRGB
	@make --no-print-directory makeCMYK
	@make --no-print-directory mantel
	@make --no-print-directory inhalt
	@mv ersti.pdf druck_inhalt.pdf
	@mv mantelbogen.pdf druck_mantel.pdf
	@make --no-print-directory clean
	@echo -e "\v\v\v\v\vFolgende Daten wurden erstellt:\ndruck_inhalt.pdf\tEnthält nur den Innenteil, CMYK Format\ndruck_mantel.pdf\tEnthält nur das Cover, CMYK Format"

inhalt:
	@echo -n "TeXe den Inhalt"
	@pdflatex -interaction batchmode -draftmode -file-line-error -halt-on-error "ersti.tex" > /dev/null || (echo -e "\n\n"; cat ersti.log | grep "^\./" --after-context=100; exit 1)
	@makeglossaries -c -q ersti || ~/texmf/tex/makeglossaries -c -q ersti
	@echo -n "."
	@pdflatex -draftmode ersti.tex > /dev/null
	@echo -n "."
	@pdflatex ersti.tex > /dev/null
	@echo "."

mantel:
	@echo -n "TeXe den Mantelbogen"
	@pdflatex -interaction batchmode -draftmode -file-line-error -halt-on-error "mantelbogen.tex" > /dev/null || (echo -e "\n\n"; cat mantelbogen.log | grep "^\./" --after-context=100; exit 1)
	@echo -n "."
	@pdflatex -draftmode mantelbogen.tex  > /dev/null
	@echo -n "."
	@pdflatex mantelbogen.tex  > /dev/null
	@echo "."

makeCMYK:
	@echo "Konvertiere Landkarten ins CMYK-Format…"
#	@convert bilder/altstadt.svg -colorspace CMYK -density 600 -resample 600 bilder/altstadt_cmyk.pdf
#	@convert cover/nhf_farbe.svg -colorspace CMYK -density 600 -resample 600 cover/nhf_cmyk.pdf
#	@convert cover/philweg_farbe.svg -colorspace CMYK -density 600 -resample 600 cover/philweg_cmyk.pdf
	@gs -obilder/altstadt_cmyk.pdf  -sDEVICE=pdfwrite -sProcessColorModel=DeviceCMYK -sColorConversionStrategy=CMYK -sColorConversionStategyForImages=CMYK bilder/altstadt.pdf
	@gs -ocover/philweg_cmyk.pdf  -sDEVICE=pdfwrite -sProcessColorModel=DeviceCMYK -sColorConversionStrat\
egy=CMYK -sColorConversionStategyForImages=CMYK cover/philweg_rgb.pdf
	@gs -ocover/nhf_cmyk.pdf  -sDEVICE=pdfwrite -sProcessColorModel=DeviceCMYK -sColorConversionStrat\
egy=CMYK -sColorConversionStategyForImages=CMYK cover/nhf_rgb.pdf

makeRGB:
	@[ -e "cover/philweg_rgb.pdf" ] && [ -e "bilder/altstadt.pdf" ] && [ -e "cover/nhf_rgb.pdf" ] && echo -e "\t\tLandkarten wurden NICHT aktualisiert, weil das so lange dauert. Rufe 'make makeRGBreal' auf, wenn Du sie geändert hast." || make --no-print-directory makeRGBreal


makeRGBreal:
	@echo "Konvertiere Landkarten ins RGB-Format…"
	@./svg2pdf bilder/altstadt.svg bilder/altstadt.pdf
	@./svg2pdf cover/nhf_farbe.svg cover/nhf_rgb.pdf
	@./svg2pdf cover/philweg_farbe.svg cover/philweg_rgb.pdf

makeGIT:
	@echo "Hole letztes Änderungsdatum aus Git…"
	@git log -1 --format=%h .> GITHASH
	@git log -1 --format=%cd .> GITDATE

clean:
	@echo "Entferne temporäre Dateien…"
	@rm -f ersti.pdf
	@rm -f mantelbogen.pdf
	@rm -f config.tex
	@rm -f GITHASH
	@rm -f GITDATE
	@rm -f *.log *.aux *.toc *.bbl *.blg *.toc *.out *.glo *.ilg *.ist *.ind *.glg *.gls

druckopen: druck
	open druck_inhalt.pdf

all: web druck archiv
	@echo -e "\v\v\v\v\vFolgende Dateien wurden erstellt:\ndruck_inhalt.pdf\tEnthält nur den Innenteil, CMYK Format\ndruck_mantel.pdf\tEnthält nur das Cover, CMYK Format\nwebseite.pdf\t\tEnthält Cover und Inhalt in einem PDF, Grafiken sind als Vektoren eingebunden, RGB Format\narchive.pdf\t\tBitte je einmal ausdrucken, mit entsprechend vielen Exemplaren\n\t\tdes Ersti-Infos in Umschäge packen und in die Post geben."

webopen: web
	open webseite.pdf

spell:
	@find . -name "*.tex" -exec aspell -p ./aspelldic -l de_DE -t -x -c {} \;
	@echo "Alle TeX Dateien gearbeitet. Fertig!"

archiv:
	@echo -n "."
	@pdflatex -draftmode archive.tex > /dev/null
	@echo -n "."
	@pdflatex archive.tex > /dev/null
	@echo -n "."
	@make --no-print-directory clean
	@echo -e "\v\v\v\v\vFolgende Datei wurde erstellt:\narchive.pdf\tBitte je einmal ausdrucken, mit entsprechend vielen Exemplaren\n\t\tdes Ersti-Infos in Umschäge packen und in die Post geben."
