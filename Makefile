TARGET=WibS.pdf
SRC = sections/*.tex header/header.tex tikz/*.tex
LL=pdflatex

all: $(TARGET) revision.tex

pdf: $(TARGET) revision.tex

.PHONY : clean revision.tex

revision.tex:
	echo "\\newcommand{\\revision}{`git show-ref refs/heads/master | cut -d " " -f 1 | cut -c 1-7`}" > revision.tex

%.toc: $(TARGET:%.pdf=%.tex) $(SRC)
	$(LL) $<
	rm $(TARGET)

$(TARGET): $(TARGET:%.pdf=%.tex) $(SRC)
	$(LL) $<

clean:
	rm -f $(TARGET)
	rm -f *.out
	rm -f *.aux
	rm -f *.log
	rm -f *.toc

