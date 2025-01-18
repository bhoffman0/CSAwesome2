#!/usr/bin/env perl

#
# Ad-hoc fixes to the generated ptx that aren't worth trying to handle properly
# in the conversion and XML rewriting.
#

use warnings;
use strict;
use File::Basename;

if ($ARGV[0] eq "--debug") {
  shift;
} else {
  $^I = '';
}

# Get the filename from the command-line argument
my $file = $ARGV[0];
my $filename = fileparse($file, qr/\.[^.]*/);

while (<>) {

  # New <code> instead of <input>
  s/<input>/<code>/g;
  s/<\/input>/<\/code>/g;

  s/language="python"/language="java"/g;
  
  # Replace section xml:ids with the filename
  s/<section xml:id=".*?">/<section xml:id="$filename">/g;
  s/<section>/<section xml:id="$filename">/g;

  # Remove the hard-coded numbering of exercises Q6: or 1-1-1:
  s/Q\-\d+\://g;
  s/\d+\-\d+\-\d+\://g;
  s/Figure \d\: //g;

  # Strip out <exercises> and </exercises> tags because it doesn't get added to the total at the bottom of the page
  s/<exercises.*?>//g;
  s/<\/exercises>//g;

  # idx for index hacking - try it
  s/\['single',\\ '(.*?)',.*?\]/<idx>$1<\/idx>\n/g;
  s/\['pair',\\ '(.*?);\\ (.*?)',.*?\]/<idx><h>$1<\/h><h>$2<\/h><\/idx>\n/g;
  s/<index entries="//g;
  s/" inline="False"\/>//g;
  s/\\ / /g;
  s/\%\%/\%/g;

  # <ul><li> </li></ul><pre>
  s/&lt;ul&gt;/<ul>/g;
  s/&lt;\/ul&gt;/<\/ul>/g;
  s/&lt;li&gt;/<li>/g;
  s/&lt;\/li&gt;/<\/li>/g;
  s/<raw format="html" xml:space="preserve">/<p>/g;
  s/<\/raw>/<\/p>/g;
  s/&lt;a href="(.*?)" target="_blank"&gt;(.*?)&lt;\/a&gt;/<url href="$1" visual="$1">$2<\/url>/g;
  s/&lt;pre&gt;/<pre>/g;
  s/&lt;\/pre&gt;/<\/pre>/g;

  # For tests, put in time-limit to have it generate as a test. Pretests are no-feedback.
  # There are some with 'timelimit': 45, but we could make them all untimed.
  s/<exercises line=.*nofeedback.*>/<exercises time-limit="1000" timer="no" feedback="no" results="no">/g;
  s/<exercises line=.*(test|exam|midterm).*>/<exercises time-limit="1000" timer="no">/g;
 
  print;
}
