Figures  = $(shell find Figures -iname "*.svg")
Figures += $(shell find Template/Figures -iname "*.svg")
Figures := $(Figures:%.svg=%.pdf)

Source += $(shell find . -iname "*.tex")
Source += $(shell find . -iname "*.bib")
Source += $(shell find Figures -iname "*.jpg")
Source += $(shell find Figures -iname "*.png")
Source += $(shell find Figures -iname "*.svg")
Source += $(shell find Figures -iname "*.pdf")
#-------------------------------------------------------------------------------

Output += Article.pdf
Output += Report.pdf
#-------------------------------------------------------------------------------

.PHONY: all figures clean all_options
.SECONDARY:

all: $(Output)

figures: $(Figures)

clean:
	rm -f $(Figures)
	rm -f *.aux *.bbl *.blg *.log *.out *.pdf *.gz *.toc *.lof *.lot
	rm -rf Output
#-------------------------------------------------------------------------------

%.pdf: %.svg
	inkscape --without-gui --file="$<" --export-area-drawing --export-text-to-path --export-pdf-version="1.5" --export-pdf="$@"
#-------------------------------------------------------------------------------

$(Output): $(Source) $(Figures)
	- bibtex $(@F:%.pdf=%)
	- pdflatex -synctex=1 -interaction=nonstopmode -quiet $(@F:%.pdf=%.tex)
	- bibtex $(@F:%.pdf=%)
	  pdflatex -synctex=1 -interaction=nonstopmode -quiet $(@F:%.pdf=%.tex)
	- bibtex $(@F:%.pdf=%)
	  pdflatex -synctex=1 -interaction=nonstopmode -quiet $(@F:%.pdf=%.tex)
#-------------------------------------------------------------------------------

all_options: $(Source) $(Figures)
	mkdir -p Output
	sh Build.sh Draft  Float  Formal
	sh Build.sh Draft  Float
	sh Build.sh Draft         Formal
	sh Build.sh Draft
	sh Build.sh        Float  Formal
	sh Build.sh        Float
	sh Build.sh               Formal
	sh Build.sh 
#-------------------------------------------------------------------------------

