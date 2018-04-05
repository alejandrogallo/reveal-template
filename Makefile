
.PHONY: all run clean

SLIDES = $(wildcard slides/*)

all: index.html

run: index.html
	python -m SimpleHTTPServer 8080

index.md: main.sed $(SLIDES)
	echo | sed -f main.sed > $@

index.html: index.md
	pandoc -s -t revealjs -V theme=league -V transition=fade $< -o $@

clean:
	-rm -f index.html
	-rm -f index.md
