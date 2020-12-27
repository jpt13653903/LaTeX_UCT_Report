Source += $(shell find .           -iname "*.tex")
Source += $(shell find ../Template -iname "*.tex")
Source += $(shell find ../         -iname "*.bib")
Source += $(shell find ../Figures  -iname "*.jpg")
Source += $(shell find ../Figures  -iname "*.png")
Source += $(shell find ../Figures  -iname "*.svg")
Source += $(shell find ../Figures  -iname "*.pdf")
#-------------------------------------------------------------------------------

Output = Report.pdf
#-------------------------------------------------------------------------------

.PHONY: all figures clean
.SECONDARY:

all: $(Output)

figures:
	$(MAKE) -C ../ figures

clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.pdf *.gz *.toc *.lof *.lot
	$(MAKE) -C ../Figures clean
#-------------------------------------------------------------------------------

$(Output): figures $(Source)
	- bibtex $(@F:%.pdf=%)
	- pdflatex -synctex=1 -interaction=nonstopmode -quiet $(@F:%.pdf=%.tex)
	- bibtex $(@F:%.pdf=%)
	  pdflatex -synctex=1 -interaction=nonstopmode -quiet $(@F:%.pdf=%.tex)
	- bibtex $(@F:%.pdf=%)
	  pdflatex -synctex=1 -interaction=nonstopmode -quiet $(@F:%.pdf=%.tex)
#-------------------------------------------------------------------------------

