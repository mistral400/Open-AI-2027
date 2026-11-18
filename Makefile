SHELL := /bin/bash
PANDOC := pandoc
SOURCES := $(sort $(wildcard docs/*.md))
METADATA := metadata.yaml
DEFAULTS := pandoc/defaults.yaml

.PHONY: pdf html clean check

pdf:
	@mkdir -p build
	$(PANDOC) $(SOURCES) \
	  --metadata-file=$(METADATA) \
	  --defaults=$(DEFAULTS) \
	  -o build/OpenAI-2027.pdf

html:
	@mkdir -p build
	$(PANDOC) $(SOURCES) \
	  --metadata-file=$(METADATA) \
	  --standalone --toc --number-sections \
	  -o build/OpenAI-2027.html

check:
	@command -v pandoc
	@command -v xelatex

clean:
	rm -f build/*.pdf build/*.html
