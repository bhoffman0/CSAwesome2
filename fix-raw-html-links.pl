#!/usr/bin/env perl

#
# Fix all the raw:: html links in the rst.
#

use warnings;
use strict;

$/ = undef;
$^I = '';

my %urls;
my %texts;

while (<>) {

  while (s/^\s*^\.\.\s+\|([^\|]+?)\|[ \t]+raw::\s+html\s+<a href\s*=\s*"(.*?)".*?>(.*?)<\/a>\s+/\n/msg) {
    $urls{$1} = $2;
    $texts{$1} = $3;
  }

  foreach my $slug (keys %urls) {
    print STDERR "Replacing ", substr($slug, 0, 20), " in $ARGV\n";
    s{\|$slug\|}{'`' . $texts{$slug} . ' <' . $urls{$slug} . '>`_'}ge;
  }

  print;
}
