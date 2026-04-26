.PHONY: build watch clean open

build:
	typst compile main.typ

watch:
	typst watch main.typ

open: build
	open main.pdf

clean:
	rm -f main.pdf
