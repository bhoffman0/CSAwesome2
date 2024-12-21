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

  # New <code> instead of <input>
  s/<input>/<code>/g;
  s/<\/input>/<\/code>/g;
  
  # Translate xml:ids that were generated in the docs to the ones used in the xrefs.
  s/ref=".*mariscal"/ref="briceida-mariscal-id1"/g;
  s/ref=".*lira"/ref="carla-de-lira-id1"/g;
  s/ref=".*mbayo"/ref="camille-mbayo-id1"/g;

  # Remove the hard-coded numbering of exercises Q6: or 1-1-1:
  s/Q\-\d+\://g;
  s/\d+\-\d+\-\d+\://g;
  s/Figure \d\: //g;

  # Replace problematic images - maybe get rid of writing too
  #s/<problematic refid="id\d+">\|CodingEx\|<\/problematic>/<image class="imgex" source="_static\/codingExercise.png" width="5%" alt="coding exercise"\/>/g;
  #s/<problematic refid="id\d+">\|Exercise\|<\/problematic>/<image class="imgex" source="_static\/exercise.png" width="5%" alt="exercise"\/>/g;
  #s/<problematic refid="id\d+">\|Groupwork\|<\/problematic>/<image class="imgex" source="_static\/groupwork.png" width="5%" alt="groupwork"\/>/g;
  #s/<problematic refid="id\d+">\|.*\|<\/problematic>//g;

  # For tests, put in time-limit to have it generate as a test. Pretests are no-feedback.
  # There are some with 'timelimit': 45, but we could make them all untimed.
  s/<exercises line=.*nofeedback.*>/<exercises time-limit="1000" timer="no" feedback="no" results="no">/g;
  s/<exercises line=.*(test|exam|midterm).*>/<exercises time-limit="1000" timer="no">/g;
 
  print;
}
