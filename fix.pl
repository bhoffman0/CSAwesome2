#!/usr/bin/env perl

use warnings;
use strict;

my $OPEN_LT = "TAG_PLACEHOLDER_SHOULD_NOT_EXIST_IN_FEEDBACK";

$^I = '';

while (<>) {

  # Some blocks start with .. .. which seems to get translated to a comment
  # but if the block then contains --- that's not something that can appear in
  # an XML comment.
  s/^\.\. \.\./../;

  #if (/<\w+\s+.*?[-a-z]+=(?!['"])/) {
  #  die "$_";
  #}

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

    # Fix <br> tags to be XMLish.
    s/<br>/<br\/>/g;

  }
  print;
}
