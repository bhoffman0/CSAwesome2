#!/usr/bin/env perl

use warnings;
use strict;

my $OPEN_LT = "TAG_PLACEHOLDER_SHOULD_NOT_EXIST_IN_FEEDBACK";

$^I = '';

while (<>) {
  if (/^\s+:feedback/) {

    if (/$OPEN_LT/) {
      die "$OPEN_LT occured!";
    }

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
}
