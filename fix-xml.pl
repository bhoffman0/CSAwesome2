#!/usr/bin/env perl

#
# A bunch of ad-hoc fixes to the generated XML, mostly dealing with places where
# the content contains characters that need to be escaped in XML.
#

use warnings;
use strict;

if ($ARGV[0] eq "--debug") {
  shift;
} else {
  $^I = '';
}

# I think this is or was at some point the default width.
my $page_width = 560;

sub width {
  my ($px) = @_;;
  my $percent = int(100 * $px/$page_width + 0.5);
  return $percent > 100 ? 100 : $percent;
}

while (<>) {

  # More or less ad-hoc escaping of special XML characters. Some of these may no
  # longer be needed as I fixed at least part of the escaping of activecode nodes.
  s/\b([A-Z]\w+)<([A-Z]\w+)>/$1&lt;$2>/g;
  s/ArrayList<(int)>/ArrayList&lt;$1>/g;
  s/ArrayList<>/ArrayList&lt;>/g;
  s/ <( |=)/ &lt;$1/g;
  s/len<=/len&lt;=/g;
  s/ &&( |$)/ &amp;&amp;$1/g;
  s/ & / &amp; /g;
  s/"&&"/"&amp;&amp;"/g;

  s/&&<\/cline>/&amp;&amp;<\/cline>/g;
  s/"<(\/?(sup|q))>"/"&lt;$1>"/g;
  s{\[<q>, </q>, </q>\]}{[&lt;q>, &lt;/q>, &lt;/q>]}g;
  s/i <"/i &lt;"/g;
  s/"<img /"&lt;img /g;

  # BH added to get rid of html or < in program comments and <E>
  s/^\s*\*\s*<(.*)</\* &lt;$1&lt;/g;
  s/^\s*\*\s*</\* &lt;/g;
  s/^\s*\*(.*)</\*$1&lt;/g;
  s/<E>/&lt;E&gt;/g;

  # Not sure what's up with this; Some of these data-optional things are
  # generated within strings of what look like JSON. Anyway, these two lines at
  # least mangle it into acceptable XML.
  s/data-optional=true/data-optional="true"/g;
  s/'data-optional="true"'/'data-optional=true'/g;

  # Fix these to be XMLish.
  s/<br>/<br\/>/g;

  # Fix px measurements to %
  s/"(\d+)px"/'"' . width($1) . '%"'/ge;

  # Fix width without px (in youtube videos) measurements to %
  s/width="(\d+)"/'width="' . width($1) . '%"'/ge;

  # Beryl added this for the newer AP questions which somehow generate
  # an extra </statement> after </choices>. Have to read in nextline to check.
  if (/<\/choices>\s*$/) {
      print;
      my $nextline = <>;
      # if the next line is not </statement>, print it; otherwise skip it
      if (defined $nextline && $nextline !~ /^\s*<\/statement>/) {
            print $nextline;
      }
  } else {
    print;
  }
}
