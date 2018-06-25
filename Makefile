# Makefile for Sphinx documentation
#

PYTHON        = python3
BUILDDIR      = _build

.PHONY: help
help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  html       to make html files in build dir"
	@echo "  clean      to remove build dir"

.PHONY: clean
clean:
	rm -rf $(BUILDDIR)

.PHONY: html
html:
	@$(PYTHON) -m gensite
	@echo
	@echo "Build finished. The HTML pages are in $(BUILDDIR)."