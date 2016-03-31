#-------------------------------------------------------------------------------
#!/bin/bash

#-------------------------------------------------------------------------------
FILENAME='template'
PDFVIEWER='open'

#-------------------------------------------------------------------------------
FLAG='-shell-escape -interaction=nonstopmode'

pdflatex       $FLAG $FILENAME.tex &> log.md
bibtex               $FILENAME     &> log.md
pdflatex       $FLAG $FILENAME.tex &> log.md
pdflatex       $FLAG $FILENAME.tex &> log.md
makeindex            $FILENAME.idx &> log.md
makeglossaries       $FILENAME     &> log.md
pdflatex       $FLAG $FILENAME.tex &> log.md

cat log.md | egrep "Error|Warning"

$PDFVIEWER $FILENAME.pdf &

#-------------------------------------------------------------------------------
rm -f *.acn \
      *.acr \
      *.alg \
      *.bbl \
      *.blg \
      *.glg \
      *.glo \
      *.gls \
      *.glsdefs \
      *.idx \
      *.ilg \
      *.ind \
      *.ist \
      *.log \
      *.out \
      *.ptc \
      *.run.xml \
      *.toc \
      *.bib

find . -name \*.aux -delete
find . -name \*.DS_store -delete
find . -name \*.swp -delete
