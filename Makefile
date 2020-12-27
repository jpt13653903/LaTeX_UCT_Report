.PHONY: all figures clean all_options
.SECONDARY:

all: figures
	$(MAKE) -C Article
	$(MAKE) -C Report

figures:
	$(MAKE) -C Figures

clean:
	rm -rf Output
	$(MAKE) -C Figures clean
	$(MAKE) -C Article clean
	$(MAKE) -C Report  clean

all_options:
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

