This branch is where we are working on the conversion from rst to PreTeXt.
Because we are also working on reorganizing the book for the College Board’s
2025 changes to the CSA curriculum, the current plan is to do the reorganization
work in `main` and then to pull over individual chapters into this branch as we
are ready to deal with debugging the conversion. Since this branch was created
from `main` we should be able to `git checkout` individual files from `main` and
then eventually do a `git merge` to convince `git` that everything fits
together.

The way things work in this branch is a bit unorthodox insofar as we have
committed both the rst source files under `_sources/` and the generated PreTeXt
under `pretext/` into git but scripts here change both of those when we build.
The idea is that by committing them we can easily see what changes our
conversion scripts introduce. As long as the scripts are working, we should
probably only commit changes to rst files if there are hand edits we need to
make that can’t be handled by the scripts; that way we will have a small number
of changes to resolve if and when we need to merge changes that are made in
`main` during the reorg work. But it is okay if the rst files in this branch can
no longer be used directly to produce the book; that’s what `main` is for.

Similarly, while we can edit the generated ptx, we want to avoiod that for as
long as possible. Our eventual goal is to generate ptx from some easier to edit
format—either rst (possibly processed by scripts first) or Markdown. But we do
have an escape hatch built in at the moment in that we can commit any hand-fixed
ptx files under the `hand-fixes` directory and they will be copied over the
generated files as part of the build process.

Note that in general after doing a build and before committing, we should run
`make restore` that restores `_sources` and `pretext` to their bre-build state.

Note that in conjunction with the changes in this repo we also had to make some
changes in [bnmnetp/Runestone2PreTeXt][1]. Most of these have since been merged
but we may have to make more as we go. We will keep any changes that haven’t
been merged into Brad’s repo in the `combined-fixes` of the
[gigamonkey/Runestone2PreTeXt][2] fork.

Other than those changes, the main thing I did here was add several files:

  - `Makefile`: a GNU makefile for running various parts of the conversion.
    You'll need to set the `R2P` variable in a `.env` file or otherwise get it
    in your environment to the location of your local copy of the
    `Runestone2PreTeXt` repo.

  - `fix-raw-html-links.pl`: A perl script that rewrites the places in the rst
    that used raw html sections to add links with a `_blank` target.

  - `fix-source.pl`: A perl script that patches various things in the .rst files
    that caused problems Some of those changes, like fixing unescaped & and < in
    embedded HTML should perhaps be committed to the source.

  - `fix-xml.pl`: A perl script to fix the first batch of XML generated with
    sphinx, to make it actually valid XML. Some of the bits in here, as one of
    the comments mentions, may no-longer be necessary as some of my fixes to the
    Runestone scripts may now cover them.

  - `fix-ptx.pl`: A perl script that patches up a few xrefs in the generated ptx.

  - `post-1.xsl`, `post-2.xsl`, and `post-3.xsl`: tXSLT stylesheets that are run
    by the `Makefile` after the main XSLT stylesheet from `Runestone2PreTeXt`.

  - `hand-fixes/Unit8-2DArray/routeCipherA.ptx`: This is one file that I just gave
    up and hand fix the generated ptx. The makefile will copy this file over the
    generated one so if the .rst source changes, the hand fixes will need to be
    redone. But the mechanism is general so any .ptx file that doesn't come out
    quite right can be replaced with a parallel file under the `hand-fixes`
    directory.


[1]: <https://github.com/bnmnetp/Runestone2PreTeXt/pulls?q=is%3Apr+author%3Agigamonkey>
[2]: <https://github.com/gigamonkey/Runestone2PreTeXt/tree/combined-fixes>
