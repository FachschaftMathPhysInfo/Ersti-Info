##
##  Makefile
##
##
##
##
##

file=pdfx


all: pdf out index changes
	make pdf

out:
	if  [ -f $(file).out ] ; then cp $(file).out tmp.out; fi ;
	sed 's/BOOKMARK/dtxmark/g;' tmp.out > x.out; mv x.out tmp.out ;

pdf:
	pdflatex $(file).dtx 

index:
	makeindex -s gind.ist -o $(file).ind $(file).idx 

changes:
	makeindex -s gglo.ist -o $(file).gls $(file).glo

xview:
	xpdf -z 200 $(file).pdf &>/dev/null

view:
	acroread $(file).pdf

ins:
	latex pdfx.ins 

diff:
	diff $(file).sty ../$(file).sty |less

copy:
	cp $(file).sty ../

