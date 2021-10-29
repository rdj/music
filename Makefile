%.pdf: %.ly
	lilypond -s --pdf $<

all: $(addsuffix .pdf, $(basename $(wildcard *.ly)))

.PHONY: clean
clean:
	-rm -f *.pdf
