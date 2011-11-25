install: rm_pdf copy_styles make_bibliography make_pdf clean
	evince apresentacao.pdf &

make_pdf:
	pdflatex -shell-escape apresentacao
	pdflatex -shell-escape apresentacao

make_bibliography:
#	pdflatex -shell-escape apresentacao
#	bibtex apresentacao
#	pdflatex -shell-escape apresentacao
#	pdflatex -shell-escape apresentacao

rm_pdf:
	rm -f apresentacao.pdf

copy_themes:
	mkdir -p ~/texmf/tex/latex/beamer
	cp -r themes/*.sty ~/texmf/tex/latex/beamer

copy_styles:
	mkdir -p ~/texmf/tex/latex/beamer
	cp -r stys/*.sty ~/texmf/tex/latex/beamer

clean:
	rm -f *.aux
	rm -f *.bbl
	rm -f *.bak
	rm -f *.log
	rm -f *.blg
	rm -f *.toc
	rm -f *.lot
	rm -f *.lof
	rm -f *.dvi
	rm -f *.idx
	rm -f *.ilg
	rm -f *.ind
	rm -f **/*~
	rm -f *~
	rm -f apresentacao.ps
	rm -f apresentacao.dvi
	rm -f *.nav
	rm -f *.out
	rm -f *.snm
	rm -f apresentacao.pyg
	rm -f apresentacao.vrb

