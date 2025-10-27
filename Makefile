# Makefile for MkDocs site
SHELL := /bin/bash

.PHONY: help serve deploy clean

help:
	@echo "Common commands:"
	@echo "  make serve   - build and preview site locally (auto-reloads)"
	@echo "  make deploy  - push site to GitHub (triggers GitHub Pages)"
	@echo "  make clean   - remove local build folder"

serve:
	source .venv/bin/activate && mkdocs serve

deploy:
	source .venv/bin/activate && \
	git add . && \
	read -p "Commit message: " msg; \
	git commit -m "$$msg" && \
	git push

clean:
	rm -rf site/
