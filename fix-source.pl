#!/usr/bin/env perl

use warnings;
use strict;

if ($ARGV[0] eq "--debug") {
  shift;
} else {
  $^I = '';
}

my $OPEN_LT = "LESS_THAN_PLACEHOLDER_SHOULD_NOT_EXIST_IN_ACTUAL_TEXT";

my $in_header = 1;
my $in_youtube = 0;
my $first_section = 0;

while (<>) {

  # Skip the .. include and .. |Time90| stuff in toctree.rst files.
  if ($ARGV =~ /toctree.rst/ and $in_header) {
    if (/^\w/) {
      $in_header = 0;
    } else {
      next;
    }
  }

  # This include doesn't exist in this branch so for now strip it out
  /\Q.. include:: ..\/common.rst/ and next;

  # A few files have busted markup for the first section
  if (!$first_section and /^-{3,}\s*$/) {
    s/-/=/g;
    $first_section = 1;
  }


  # These are images put at the top of some pages. When converting to XML that
  # causes the XML document to not have a single root element. So we make them
  # into image references for now. Later on we'll have to figure out how to put
  # the images back into the rendered HTML.
  s{^.. (image:: (\.\./)+_static/time)}{.. |ClockImageToBeFixed| $1}g;
  s{^.. (image:: (\.\./)+_static/CSAwesomeLogo.png)}{.. |LogoImageToBeFixed| $1}g;

  # Also remove the time elements for now and replace with a comment (BH)
  s/^\|Time(\d\d)\|/..  \|Time$1\|/g;

  if (/^\.\. youtube::/i) {
    $in_youtube = 1;
  } elsif ($in_youtube && /^[^ ]/) {
    $in_youtube = 0;
  }

  # Add px to image widths except in youtube sections
  if (!$in_youtube) {
    s/:width:\s+(\d+)(?!px|\d)/:width: $1px/g;
  }

  # Specific fixes for some items that in the .rst contain some HTML which is
  # occasionally broken and often contains unescaped & and <.
  if (/^\s+:(feedback|answer)/) {

    if (/$OPEN_LT/) {
      die "$OPEN_LT occured!";
    }

    # Fix some broken close tags.
    s/(<\/\w+)\b(?!>)/$1>/g;

    # Swap out <'s in actual embedded tags.
    s/<(?=\/?\w+>)/$OPEN_LT/g;

    # unescape any that are actually escaped.
    s/&amp;/&/g;
    s/&lt;/</g;

    # Escape
    s/&/&amp;/g;
    s/</&lt;/g;

    # Put back the tag <'s.
    s/$OPEN_LT/</g;

  }
  print;

} continue {
  if (eof) {
    close ARGV;
    $in_header = 1;
  }
}
