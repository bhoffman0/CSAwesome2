#!/usr/bin/env perl

#
# Ad-hoc fixes to the generated ptx that aren't worth trying to handle properly
# in the conversion and XML rewriting.
#

use warnings;
use strict;

if ($ARGV[0] eq "--debug") {
  shift;
} else {
  $^I = '';
}

while (<>) {

  # Translate xml:ids that were generated in the docs to the ones used in the xrefs.
  s/xml:id="_briceida-mariscal-id1(-\d+)?"/xml:id="interviewees_b_-mariscal"/g;
  s/xml:id="_carla-de-lira-id1(-\d+)?"/xml:id="interviewees_c_-de_-lira"/g;
  s/xml:id="_camille-mbayo-id1(-\d+)?"/xml:id="interviewees_c_-mbayo"/g;

  # For tests, put in time-limit to have it generate as a test. Pretests are no-feedback.
  # There are some with 'timelimit': 45, but we could make them all untimed.
  s/<exercises line=.*nofeedback.*>/<exercises time-limit="" feedback="no">/g;
  s/<exercises line=.*(test|exam|midterm).*>/<exercises time-limit="">/g;
 
  print;
}
