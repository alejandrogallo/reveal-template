# Reveal.js template

This template only uses very simple tools to set-up a presentation:

* Make
* [pandoc](http://pandoc.org/installing.html)
* sed

## Features

* Write in markdown, html or latex, which means that is also done with
  people writing formulas in mind.
* Automatic conversion from all formats into html.
* Building just by hitting `make`.

## Getting started

Install [pandoc](http://pandoc.org/installing.html), on ubuntu/debian

```
sudo apt-get install pandoc
```

```
git clone --recursive https://github.com/alejandrogallo/reveal-template
make
```

Write your slides in `slides/` in markdown, html or latex and add the
slides in the `main.sed` file with the `html` extension.

The makefile will convert (if necessary) your slides into html and
will create an `index.html` file.
