#!/usr/bin/env perl

use warnings;
use strict;

$^I = '.bak';

while (<>) {
    if (/^\s+:feedback/) {
        # Unescape any that are actually escaped.
        s/&amp;/&/g;
        s/&lt;/</g;

        # Escape
        s/&/&amp;/g;
        s/</&lt;/g;
    }
    print;
}
