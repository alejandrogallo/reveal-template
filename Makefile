include config.mk

.PHONY: all run clean

SLIDES = $(shell grep -E -h -o 'slides/.*' main.sed)

$(info )
$(info Slides)
$(info =======)
$(info $(SLIDES))
$(info )

all: index.html

run: index.html
	python -m SimpleHTTPServer 8080

main.html: main.sed $(SLIDES) Makefile
	echo | sed -f main.sed > $@

%.html: %.tex
	pandoc -f latex -t revealjs $< -o $@

%.html: %.md
	pandoc -f markdown-tex_math_dollars -t revealjs $< -o $@

index.html: main.html
	pandoc \
		--template=template/template-revealjs.html \
		-t html5 \
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
	-rm -f main.html
