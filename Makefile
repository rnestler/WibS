TARGET=WibS.pdf
SRC = sections/*.tex header/header.tex
LL=pdflatex

all: $(TARGET) revision.tex

.PHONY : clean revision.tex

revision.tex:
	echo "\\newcommand{\\revision}{`git show-ref refs/heads/master | cut -d " " -f 1 | cut -c 1-7`}" > revision.tex

$(TARGET): $(TARGET:%.pdf=%.tex) $(SRC)
	$(LL) $<

clean:
	rm -f $(TARGET)
	rm -f *.out
	rm -f *.aux
	rm -f *.log

