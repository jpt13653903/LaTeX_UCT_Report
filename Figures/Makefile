Source  = $(shell find . -iname "*.svg")
Output := $(Source:%.svg=%.pdf)
#-------------------------------------------------------------------------------

.PHONY: all clean
.SECONDARY:

all: $(Output)

clean:
	rm -f $(Output)
#-------------------------------------------------------------------------------

%.pdf: %.svg
	inkscape --export-area-drawing --export-text-to-path --export-pdf-version="1.5" -o "$@" "$<"
#-------------------------------------------------------------------------------

