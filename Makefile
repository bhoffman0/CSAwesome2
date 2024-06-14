.PHONY: all fixed_source xml fixed_xml ptx post fix_ids post2 post3 build_web clean pristine restore onetime

#
# .env sets some environment varibles that we don't want to commit
#
ifeq ($(origin R2P), undefined)
include .env
endif

DEBUG_PRETEXT := # -v DEBUG

xml := $(shell find build/xml -type f)
ptx := $(patsubst build/xml/%.xml,pretext/%.ptx,$(xml))

# This will run from a virtual env.
rs2ptx := python -m runestone rs2ptx

all: fixed_source fixed_xml
	$(MAKE) ptx post fixed_ptx build_$(TARGET)

fixed_source:
	find _sources/ -name '*.rst' -exec ./fix-source.pl {} \;
	find _sources/ -name '*.rst' -exec ./fix-raw-html-links.pl {} \;

xml:
	$(rs2ptx)

fixed_xml: xml
	find build/xml -name '*.xml' -exec ./fix-xml.pl {} \;

fixed_ptx:
	find pretext -name '*.ptx' -exec ./fix-ptx.pl {} \;
	find pretext -name '*.ptx' -exec ./fix-tests.pl {} \;
	rsync -r hand-fixes/ pretext/

# This works better than the script that does them all
pretext/%.ptx: build/xml/%.xml | pretext
	mkdir -p $(dir $@)
	xsltproc --novalid $(R2P)/docutils2ptx.xsl $< > $@.pass1
	xsltproc --novalid post-1.xsl $@.pass1 > $@.pass2
	xsltproc --novalid post-2.xsl $@.pass2 > $@.pass3
	xsltproc --novalid post-3.xsl $@.pass2 > $@
	find pretext/ -name '*.pass?' -delete

ptx: $(ptx) pretext/rs-substitutes.xml

# need to do pretext init in here to generate project.ptx
# need to manually edit project.ptx and create publication-rs-for-all.xml
#   as described in https://github.com/bnmnetp/Runestone2PreTeXt/blob/main/README.md
post:
	python $(R2P)/fixIds.py
	python $(R2P)/fix_xrefs.py
	python $(R2P)/reformatPtx.py
	python $(R2P)/toctree2xml.py .
	python $(R2P)/filltoc.py pretext _sources
	python $(R2P)/copy_figs.py ./_sources ./pretext/assets

restore:
	git restore pretext
	git restore _sources/
	git restore rs-substitutes.xml
	git clean -fdx pretext

onetime:
	python $(R2P)/index2main.py

build_web:
	pretext $(DEBUG_PRETEXT) build web

build_runestone:
	pretext $(DEBUG_PRETEXT) build runestone

pretext:
	mkdir $@

pretext/rs-substitutes.xml: rs-substitutes.xml | pretext
	cp $< $@

clean: restore
	rm -rf build/xml

pristine: clean
	git restore _sources
