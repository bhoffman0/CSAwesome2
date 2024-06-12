.PHONY: all fixed_source xml fixed_xml ptx post fix_ids post2 post3 build_web clean pristine

ifeq ($(origin R2P), undefined)
$(error R2P needs to be set in the environment, e.g. via a .env file)
endif

DEBUG_PRETEXT := # -v DEBUG

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

# need to do pretext init in here to generate project.ptx
# need to manually edit project.ptx and create publication-rs-for-all.xml
#   as described in https://github.com/bnmnetp/Runestone2PreTeXt/blob/main/README.md
post:
	python $(R2P)/fixIds.py
	python $(R2P)/fix_xrefs.py
	python $(R2P)/reformatPtx.py
	python $(R2P)/index2main.py
	python $(R2P)/toctree2xml.py .
	python $(R2P)/filltoc.py pretext _sources
	python $(R2P)/copy_figs.py ./_sources ./pretext/assets

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
