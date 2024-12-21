#!/usr/bin/env perl

#
# Fix the unit test which are not generated properly by the basic conversion.
#

use warnings;
use strict;

if ($ARGV[0] eq "--debug") {
  shift;
} else {
  $^I = '';
}

$/ = undef;

while (<>) {

  s{<code>(.*?)====(.*?)</code>}{<code>$1</code><tests>$2</tests>}msg;

  print;
}
