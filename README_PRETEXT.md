This branch was created mostly as an experiment to see how far I could get with
converting to PreTeXt. The basic idea was to try and automate as much as
possible so I'd be able to rerun the conversion from the latest rst source
whenever. However I didn't totally stick to that plan and made a few changes to
the .rst files. Some of them may be fixes that should be made for their own sake
but a bunch of them were just hacks to get the rst into a format where it would
convert cleanly; in particular I had to rip out several `.. raw:: html` sections
that added `<style>` elements. And I hacked `pavement.py` as instructed in the
`Runestone2PreTeXt` `README`.

Note that in conjunction with the changes in this repo I also had to make
changes in [bnmnetp/Runestone2PreTeXt][1] and [RunestoneInteractive/rs][2]. All
my changes have been submitted as PRs though they have not all been merged as of
this writing (2023-06-15). In order to run the conversion you will need to set
up a virtual env in the `rs` repo such that `python -m runestone rs2ptx` runs
`runestone` from the repo rather than the `pip` installed version.

Other than those changes, the main thing I did here was add several files:

  - Makefile: a GNU makefile for running various parts of the conversion. You'll
    need to set the `R2P` variable to the location of your local copy of the
    `Runestone2PreTeXt` repo.

  - fix-source.pl: A perl script that patches various things in the .rst files
    that caused problems Some of those changes, like fixing unescaped & and < in
    embedded HTML should perhaps be committed to the source.

  - fix-xml.pl: A perl script to fix the first batch of XML generated with
    sphinx, to make it actually valid XML. Some of the bits in here, as one of
    the comments mentions, may no-longer be necessary as some of my fixes to the
    Runestone scripts may now cover them.

  - fix-ptx.pl: A perl script that patches up a few xrefs in the generated ptx.

  - post-1.xsl and post-2.xsl: two XSLT stylesheets that are run by the
    `Makefile` after the main XSLT stylesheet from `Runestone2PreTeXt`.

  - hand-fixes/Unit8-2DArray/routeCipherA.ptx: This is one file that I just gave
    up and hand fix the generated ptx. The makefile will copy this file over the
    generated one so if the .rst source changes, the hand fixes will need to be
    redone. But the mechanism is general so any .ptx file that doesn't come out
    quite right can be replaced with a parallel file under the `hand-fixes`
    directory.


[1]: <https://github.com/bnmnetp/Runestone2PreTeXt/pulls?q=is%3Apr+author%3Agigamonkey>
[2]: <https://github.com/RunestoneInteractive/rs/pulls?q=+is%3Apr+author%3Agigamonkey>
