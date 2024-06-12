#!/usr/bin/env perl

#
# Ad-hoc fixes to the generated ptx that aren't worth trying to handle properly
# in the conversion and XML rewriting.
#

use warnings;
use strict;

$/ = undef;
$^I = '';

while (<>) {

  s{<input>(.*?)====(.*?)</input>}{<input>$1</input><tests>$2</tests>}msg;

  print;
}
