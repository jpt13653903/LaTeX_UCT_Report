Figures  = $(shell find Figures -iname "*.svg")
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
#-------------------------------------------------------------------------------

Figures/%.pdf: Figures/%.svg
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

# This target is used to output all possible combinations of the option flags.

Build = bibtex $(1) ; \
        pdflatex -synctex=1 -interaction=nonstopmode -quiet $(1).tex ; \
        bibtex $(1) ; \
        pdflatex -synctex=1 -interaction=nonstopmode -quiet $(1).tex && \
        bibtex $(1) ; \
        pdflatex -synctex=1 -interaction=nonstopmode -quiet $(1).tex && \
        mv -f $(1).pdf $(1)$(2).pdf

GenOptions = echo "\Drafttrue\NoFloattrue\Formaltrue"    > Flags.tex && \
             $(call Build,$(1),_Draft_NoFloat_Formal)                && \
             echo "\Drafttrue\NoFloattrue\Formalfalse"   > Flags.tex && \
             $(call Build,$(1),_Draft_NoFloat)                       && \
             echo "\Drafttrue\NoFloatfalse\Formaltrue"   > Flags.tex && \
             $(call Build,$(1),_Draft_Formal)                        && \
             echo "\Drafttrue\NoFloatfalse\Formalfalse"  > Flags.tex && \
             $(call Build,$(1),_Draft)                               && \
             echo "\Draftfalse\NoFloattrue\Formaltrue"   > Flags.tex && \
             $(call Build,$(1),_NoFloat_Formal)                      && \
             echo "\Draftfalse\NoFloattrue\Formalfalse"  > Flags.tex && \
             $(call Build,$(1),_NoFloat)                             && \
             echo "\Draftfalse\NoFloatfalse\Formaltrue"  > Flags.tex && \
             $(call Build,$(1),_Formal)                              && \
             echo "\Draftfalse\NoFloatfalse\Formalfalse" > Flags.tex && \
             $(call Build,$(1),)

all_options: $(Source) $(Figures)
	$(call GenOptions,Article)
	$(call GenOptions,Report)
#-------------------------------------------------------------------------------

