.PHONY: build watch clean open

PDF := LucaCesaranoResume.pdf

build:
	typst compile main.typ $(PDF)

watch:
	typst watch main.typ $(PDF)

open: build
	open $(PDF)

clean:
	rm -f $(PDF)
