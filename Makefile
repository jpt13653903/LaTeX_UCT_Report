.PHONY: all figures clean all_options
.SECONDARY:

all: figures
	make -C Article
	make -C Report

figures:
	make -C Figures

clean:
	make -C Figures clean
	make -C Article clean
	make -C Report  clean

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

