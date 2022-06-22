
RST := slides.rst

AUTHOR := `whoami`
HTML := $(AUTHOR)-`date  '+%Y-%m-%d'`.html

TODAY := `date  '+%Y-%m-%d'`

OUTDIR := html_output


all: help

help:
	@echo ""
	@echo "--Help Menu"
	@echo ""
	@echo "1. make html"
	@echo "2. make dist"
	@echo "3. make clean"

html:	$(OUTDIR)
	hovercraft $(RST) $(OUTDIR)
	@cp $(OUTDIR)/index.html $(OUTDIR)/$(TODAY)_$(AUTHOR).html
#google-chrome-stable outdir/index.html&

dist: $(OUTDIR)
	@mkdir dist
	@cp $(OUTDIR)/index.html dist/$(TODAY)_$(AUTHOR).html
	@mv $(OUTDIR) $(TODAY)_$(AUTHOR) 
	@zip -r dist/$(TODAY)_$(AUTHOR).zip $(TODAY)_$(AUTHOR) 
	@rm -r $(TODAY)_$(AUTHOR)

clean:
	rm -rf $(OUTDIR)
	rm -rf dist

