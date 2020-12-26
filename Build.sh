if [ $# -gt 0 ] && [ $1 == "--help" ]; then
  echo ''
  echo 'Usage: Build.sh [Draft] [Float] [Formal]'
  echo ''
  echo 'The options can be specified in any order, but are case sensitive'
  exit 1
fi
#-------------------------------------------------------------------------------

Draft=false
Float=false
Formal=false

for arg in $@; do
  if [ $arg == Draft  ]; then Draft=true ; fi
  if [ $arg == Float  ]; then Float=true ; fi
  if [ $arg == Formal ]; then Formal=true; fi
done
#-------------------------------------------------------------------------------

echo '\newif\ifDraft  % When "true", output in "draft" mode -- useful for proofing'                             >  Article/Template/Flags.tex
echo '\newif\ifFloat  % When "false", put listings, figures and tables where you put them, instead of floating' >> Article/Template/Flags.tex
echo '\newif\ifFormal % When "true", use a more formal style (including a different title page)'                >> Article/Template/Flags.tex
echo '%-------------------------------------------------------------------------------'                         >> Article/Template/Flags.tex
echo ''                                                                                                         >> Article/Template/Flags.tex
echo "\\Draft$Draft"                                                                                            >> Article/Template/Flags.tex
echo "\\Float$Float"                                                                                            >> Article/Template/Flags.tex
echo "\\Formal$Formal"                                                                                          >> Article/Template/Flags.tex
echo '%-------------------------------------------------------------------------------'                         >> Article/Template/Flags.tex

cp -f Article/Template/Flags.tex Report/Template/Flags.tex
#-------------------------------------------------------------------------------

Suffix=""
if [ $Draft  == true ]; then Suffix="$Suffix"_Draft ; fi
if [ $Float  == true ]; then Suffix="$Suffix"_Float ; fi
if [ $Formal == true ]; then Suffix="$Suffix"_Formal; fi
#-------------------------------------------------------------------------------

make
mv -f Article/Article.pdf Output/Article$Suffix.pdf
mv -f Report/Report.pdf   Output/Report$Suffix.pdf
#-------------------------------------------------------------------------------

