MD_FILES := $(wildcard *.md)
FILES += $(patsubst %.md, %.pdf, $(wildcard *.md))
FILES += $(patsubst %.md, %.html, $(wildcard *.md))

FILTERS =
PDF_ENGINE =
PDF_OPTIONS =
PDF_FORMAT_OPTIONS = -t beamer --slide-level=2

FILTERS += --citeproc
# FILTERS += -F pandoc-crossref
PDF_ENGINE += --pdf-engine=lualatex
PDF_OPTIONS += --number-sections

REVEALJS_THEME = beige

%.pdf: %.md
	-@pandoc "$<" $(FILTERS) $(PDF_ENGINE) $(PDF_OPTIONS) $(PDF_FORMAT_OPTIONS) -o "$@"

%.html: %.md
	-@pandoc "$<" --embed-resources --standalone -t revealjs -V theme=$(REVEALJS_THEME) -o "$@"

all: $(FILES)

clean:
	-@rm $(FILES) *~

cleanall: clean

COURSE =

.PHONY: all clean

all: help

help:
	@echo 'Usage:'
	@echo '  make <target>'
	@echo
	@echo 'Targets:'
	@grep -E '^[a-zA-Z_0-9.-]+:.*?##.*$$' $(MAKEFILE_LIST) | grep -v '###' | sort | cut -d: -f1- 
	@grep -E '^###.*' $(MAKEFILE_LIST) | cut -d' ' -f2- | awk 'BEGIN {FS = "###"}; {printf "%s\n", $1}'
	@grep -E '^[a-zA-Z_0-9.-]+:.*?###.*$$' $(MAKEFILE_LIST) | sort | cut -d: -f2- | awk 'BEGIN {FS = "###"}; {printf "%s\n", $1}'
	@echo

list:   ## List of courses
	@./config/script/list-courses

prepare:        ## Generate directories structure
	@./config/script/prepare
	@touch prepare

submodule:      ## Update submodules
	git submodule update --init --recursive
	git submodule foreach 'git fetch origin; git checkout $$(git rev-parse --abbrev-ref HEAD); git pull'
