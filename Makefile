MAIN_FILE=report
OUTPUT_FILE_NAME="Efficiently Checking Equivalence of Nondeterministic Finite Automata.pdf"

all:
	pdflatex $(MAIN_FILE).tex || exit 1
	biber --debug $(MAIN_FILE) || exit 1
	pdflatex $(MAIN_FILE).tex
	pdflatex $(MAIN_FILE).tex
	mv $(MAIN_FILE).pdf $(OUTPUT_FILE_NAME)

.PHONY: clean cleaner

clean:
	$(RM) *.aux *.bcf *.blg *.log *.nav *.out *.run.xml *.snm *.toc

cleaner: clean
	$(RM) $(OUTPUT_FILE_NAME) *.fdb_latexmk *.bbl
