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

  s{<input>(.*?)====(.*?)</input>}{<input>$1</input><tests>$2</tests>}msg;

  print;
}
