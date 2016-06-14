MAIN_FILE=report
OUTPUT_FILE_NAME="Efficiently Checking Equivalence of Nondeterministic Finite Automata.pdf"

all: $(MAIN_FILE).bbl $(MAIN_FILE).aux
	pdflatex $(MAIN_FILE).tex

fast: *.tex chapters.tex
	pdflatex $(MAIN_FILE).tex

$(MAIN_FILE).aux: $(MAIN_FILE).tex
	pdflatex $(MAIN_FILE).tex

$(MAIN_FILE).bbl: $(MAIN_FILE).aux biblio.bib
	biber $(MAIN_FILE)

.PHONY: clean cleaner

clean:
	$(RM) *.aux *.bcf *.blg *.log *.nav *.out *.run.xml *.snm *.toc

cleaner: clean
	$(RM) $(OUTPUT_FILE_NAME) *.fdb_latexmk *.bbl
