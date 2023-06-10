R2P := ~/3rdparty/Runestone2PreTeXt

xml := $(shell find build/xml -type f)
ptx := $(patsubst build/xml/%.xml,pretext/%.ptx,$(xml))

# This will run from a virtual env.
rs2ptx := python -m runestone rs2ptx

all:
	@echo $(ptx)

fix:
	find _sources/ -name '*.rst' -exec ./fix.pl {} \;

xml:
	$(rs2ptx)

fixed_xml: xml
	find build/xml -name '*.xml' -exec ./fix-xml.pl {} \;

# This works better
pretext/%.ptx: build/xml/%.xml | pretext
	mkdir -p $(dir $@)
	xsltproc --novalid $(R2P)/docutils2ptx.xsl $< > $@

# This works but produces .ptx files that don't get through post cleanly.
all_ptx: | pretext
	python $(R2P)/xml2ptx.py .

ptx: $(ptx)

post:
	python $(R2P)/fixIds.py
	python $(R2P)/fix_xrefs.py
	python $(R2P)/reformatPtx.py

pretext:
	mkdir $@

clean:
	rm -rf pretext
	rm -rf build/xml

pristine: clean
	git restore _sources
