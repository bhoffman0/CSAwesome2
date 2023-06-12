#!/usr/bin/env perl

#
# Ad-hoc fixes to the generated ptx that aren't worth trying to handle properly
# in the conversion and XML rewriting.
#

use warnings;
use strict;

$^I = '';

while (<>) {

  # Translate xml:ids that were generated in the docs to the ones used in the xrefs.
  s/xml:id="_briceida-mariscal-id1(-\d+)?"/xml:id="interviewees_b_-mariscal"/g;
  s/xml:id="_carla-de-lira-id1(-\d+)?"/xml:id="interviewees_c_-de_-lira"/g;
  s/xml:id="_camille-mbayo-id1(-\d+)?"/xml:id="interviewees_c_-mbayo"/g;
  
  print;
}
