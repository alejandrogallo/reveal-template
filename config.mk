AUTHOR ?= $(shell whoami)
TITLE ?= Title of my talk
DATE ?= $(shell date)

#beige black blood league moon night README.md serif simple sky solarized white
THEME ?= beige

DIST_FILES ?=\
lib/MathJax/config/ \
lib/MathJax/extensions/ \
lib/MathJax/fonts/ \
lib/MathJax/jax/ \
