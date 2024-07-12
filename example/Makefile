main.pdf: main.tex figure.svg figure.pdf
	pdflatex -shell-escape $<

figure.pdf: plot.py
	python3 $< -o $@

figure.svg: plot.py
	python3 $< -o $@

