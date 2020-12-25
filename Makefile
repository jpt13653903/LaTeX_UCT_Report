Figures  = $(shell find Figures -iname "*.svg")
Figures := $(Figures:%.svg=%.pdf)
TexFiles = $(shell find . -iname "*.tex")
#-------------------------------------------------------------------------------

Output += Article.pdf
Output += Report.pdf
#-------------------------------------------------------------------------------

.PHONY: all figures clean
.SECONDARY:

all: $(Output)

figures: $(Figures)

clean:
	rm -f $(Figures)
	rm -f *.aux *.bbl *.blg *.log *.out *.pdf *.gz *.toc *.lof *.lot
#-------------------------------------------------------------------------------

%.pdf: %.svg
	inkscape --without-gui --file="$<" --export-area-drawing --export-text-to-path --export-pdf-version="1.5" --export-pdf="$@"
#-------------------------------------------------------------------------------

%.pdf: $(TexFiles) $(Figures)
	- bibtex $*
	- pdflatex -synctex=1 -interaction=nonstopmode -quiet $*.tex
	- bibtex $*
	pdflatex -synctex=1 -interaction=nonstopmode -quiet $*.tex
	- bibtex $*
	pdflatex -synctex=1 -interaction=nonstopmode -quiet $*.tex
#-------------------------------------------------------------------------------

