#!/usr/bin/env perl

#
# Add in datafiles for turtle code and stdin for input
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
   s{>\s*<code>\s*import java\.awt}{ datafile="turtleClasses.jar,turtleClasses2.jar">\n<code>\nimport java\.awt}msg;

   s{<code>\s*import java\.util.Scanner(.*?)</code>}{<code>\nimport java\.util.Scanner$1</code>\n\t<stdin> </stdin>}msg;


  print;
}
