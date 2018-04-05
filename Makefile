include config.mk

.PHONY: all run clean

SLIDES = $(wildcard slides/*)

all: index.html

run: index.html
	python -m SimpleHTTPServer 8080

index.md: main.sed $(SLIDES) Makefile
	echo | sed -f main.sed > $@

index.html: index.md
	pandoc \
		--template=template/template-revealjs.html \
		-t html5 \
		-f markdown-tex_math_dollars \
		-V author="$(AUTHOR)" \
		-V title="$(TITLE)" \
		-V date="$(DATE)" \
		-V revealjs-url=lib/reveal.js \
		-V theme=$(THEME) \
		-V mathjax=lib/MathJax \
		-V transition=fade \
		$< -o $@

clean:
	-rm -f index.html
	-rm -f index.md
