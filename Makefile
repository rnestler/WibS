TARGET=WibS.pdf
LL=latexmk -pdf
CLEAN=latexmk -C

all: revision.tex $(TARGET)

pdf: revision.tex $(TARGET)

.PHONY : clean revision.tex $(TARGET)

revision.tex:
	echo "% Autogenerated, do not edit" > revision.tex
	echo "\\newcommand{\\revisiondate}{`git log -1 --format=\"%ad\" --date=short`}" >> revision.tex
	echo "\\newcommand{\\revision}{`git log -1 --format=\"%h\"`}" >> revision.tex
	echo "\\newcommand{\\revisionmodified}{`git status --porcelain|cut -d\" \" -f2|head -n1`}" >> revision.tex

$(TARGET): $(TARGET:%.pdf=%.tex)
	$(LL) $<

clean:
	$(CLEAN)
	rm -f revision.tex

run:
	xdg-open $(TARGET) &

