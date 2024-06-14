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

  # Find all the raw:: html links and stash them away
  while (/^\.\.\s+\|([^\|]+?)\|[ \t]+raw::[ \t]+html\s+<a href\s*=\s*"(.*?)".*?>(.*?)<\/a>\s+/msg) {
    print STDERR "Found link $1.\n";
    $urls{$1} = $2;
    $texts{$1} = $3;
  }

  # Now remove the definitions
  s/^\.\.\s+\|([^\|]+?)\|[ \t]+raw::[ \t]+html\s+<a href\s*=\s*"(.*?)".*?>(.*?)<\/a>\s+/\n/msg;

  # And now replace the references to the raw:: html sections
  foreach my $slug (keys %urls) {
    print STDERR "Replacing ", $slug, " in $ARGV\n";
    s{\|$slug\|}{'`' . $texts{$slug} . ' <' . $urls{$slug} . '>`_'}ge;
  }

  print;
}
