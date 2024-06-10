.PHONY: all fixed_source xml fixed_xml ptx post fix_ids post2 post3 build_web clean pristine

DEBUG_PRETEXT := # -v DEBUG
R2P := ~/3rdparty/Runestone2PreTeXt

xml := $(shell find build/xml -type f)
ptx := $(patsubst build/xml/%.xml,pretext/%.ptx,$(xml))

# This will run from a virtual env.
rs2ptx := python -m runestone rs2ptx

all: fixed_source fixed_xml
	$(MAKE) ptx post fixed_ptx build_web

fixed_source:
	find _sources/ -name '*.rst' -exec ./fix-source.pl {} \;

xml:
	$(rs2ptx)

fixed_xml: xml
	find build/xml -name '*.xml' -exec ./fix-xml.pl {} \;

fixed_ptx:
	find pretext -name '*.ptx' -exec ./fix-ptx.pl {} \;
	rsync -r hand-fixes/ pretext/

# This works better than the script that does them all
pretext/%.ptx: build/xml/%.xml | pretext
	mkdir -p $(dir $@)
	xsltproc --novalid $(R2P)/docutils2ptx.xsl $< > $@.pass1
	xsltproc --novalid post-1.xsl $@.pass1 > $@.pass2
	xsltproc --novalid post-2.xsl $@.pass2 > $@.pass3
	cp $@.pass3 $@

ptx: $(ptx) pretext/rs-substitutes.xml

post:
	python $(R2P)/fixIds.py
	python $(R2P)/fix_xrefs.py
	python $(R2P)/reformatPtx.py
	cp main.ptx pretext
	cp publication-rs-for-all.xml pretext
	python $(R2P)/toctree2xml.py .
	python $(R2P)/filltoc.py pretext _sources 
	python $(R2P)/copy_figs.py ./_sources ./pretext/Figures

build_web:
	pretext $(DEBUG_PRETEXT) build web

pretext:
	mkdir $@

pretext/rs-substitutes.xml: rs-substitutes.xml | pretext
	cp $< $@

clean:
	rm -rf pretext
	rm -rf build/xml

pristine: clean
	git restore _sources
