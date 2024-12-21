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
my $first_section = 1;

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
  #/\Q.. include:: ..\/common.rst/ and next;

  # A few files have busted markup for the first section markers. Standardize on
  # ='s for the first header and -'s thereafter.
  if ($first_section) {
    if (/^((-{3,})|(={3,}))\s*$/) {
      s/-/=/g;
      $first_section = 0;
    }
  } else {
    if (/^={3,}\s*$/) {
      s/=/-/g;
    }
  }

  # These are images put at the top of some pages. When converting to XML that
  # causes the XML document to not have a single root element. So we make them
  # into image references for now. Later on we'll have to figure out how to put
  # the images back into the rendered HTML.
  s{^.. (image:: (\.\./)+_static/time)}{.. .. $1}g;
  s{^.. (image:: (\.\./)+_static/CSAwesomeLogo.png)}{.. .. $1}g;


  # Also remove .. qnum:: + 2 lines that follow it.
  s/^(\.\.\s+)?qnum::.*//g;
  s/.*:prefix:.*//g;
  s/.*:start:.*//g;

  # Also remove the time elements for now.
  s/^(\.\.\s+)?(\|Time(\d+)\|)/<time length="$1"\/>/ and next;

  # Remove Exercise and Groupwork images
  s/\|CodingEx\|.*//g;
  s/\|Exercise\|.*//g;
  s/\|Groupwork\|\s+//g;

  # Attributes stdin and datafile are not being generated in XML
  # so put in some placeholders in the :language: attr to replace later on.
  # didn't really work
  #s/(\s*):stdin:\s*(.*)\s*/\n$1stdin=\"$2\"/g; 
  #s/(\s*):datafile:\s*(.*)\s*/\n$1datafile=\"$2\"/g;

  if (/^\.\. youtube::/i) {
    $in_youtube = 1;
  } elsif ($in_youtube && /^[^ ]/) {
    $in_youtube = 0;
  }

  # Add px to image widths except in youtube sections
  if (!$in_youtube) {
    s/:width:\s+(\d+)\s*$/:width: $1px\n/g;
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
