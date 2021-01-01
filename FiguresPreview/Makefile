.PHONY: all figures clean
.SECONDARY:

all: FiguresPreview.pdf

figures:
	$(MAKE) -C ../Figures

clean:
	rm -rf Body
	rm -f *.aux *.bbl *.blg *.log *.out *.pdf *.gz *.toc *.lof *.lot
	$(MAKE) -C ../Figures clean
#-------------------------------------------------------------------------------

FiguresPreview.pdf: figures
	  mkdir -p Body
	  echo "" > Body/FigureList.tex
	  for Figure in $$(find ../Figures -iname "*.pdf" -o -iname "*.jpg" -o -iname "*.png"); do \
	    echo "\\Figure{$$Figure}" >> Body/FigureList.tex; \
	  done
	  pdflatex -synctex=1 -interaction=nonstopmode -quiet FiguresPreview.tex
#-------------------------------------------------------------------------------

