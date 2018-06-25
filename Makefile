# Makefile for Sphinx documentation
#

PYTHON        = python3
BUILDDIR      = _build

.PHONY: help
help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  html           to make html files in build dir"
	@echo "  clean          to remove build dir"
	@echo "  clean-pycache  to remove __pycache__"

.PHONY: clean
clean:
	rm -rf $(BUILDDIR)

.PHONY: clean-pycache
clean-pycache:
	@find . -name __pycache__ -exec rm -rf {} +
	@echo "> Removed __pycache__"

.PHONY: html
html:
	@$(PYTHON) -m gensite
	make clean-pycache
	@echo "> Build finished. The HTML pages are in $(BUILDDIR)."


.PHONY: serve
serve:
	make html
	@echo "> Opening server:";
	@cd $(BUILDDIR); $(PYTHON) -m http.server