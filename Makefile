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

fix_xml:
	find build/xml -name '*.xml' -exec ./fix-xml.pl {} \;

pretext/%.ptx: build/xml/%.xml | pretext
	mkdir -p $(dir $@)
	xsltproc --novalid $(R2P)/docutils2ptx.xsl $< > $@

ptx: $(ptx)

pretext:
	mkdir $@

clean:
	rm -rf pretext
	rm -rf build/xml
