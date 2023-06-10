#!/usr/bin/env perl

use warnings;
use strict;

$^I = '';

while (<>) {

  s/ArrayList<([A-Z])/ArrayList&lt;$1/g;
  s/ArrayList<(int)>/ArrayList&lt;$1>/g;
  s/ArrayList<>/ArrayList&lt;>/g;

  s/ <( |=)/ &lt;$1/g;
  s/len<=/len&lt;=/g;
  s/ &&( |$)/ &amp;&amp;$1/g;
  s/ & / &amp; /g;
  s/"&&"/"&amp;&amp;"/g;
  s/\b([A-Z]\w+)<([A-Z]\w+)>/$1&lt;$2>/g;
  s/data-optional=true/data-optional="true"/g;
  s/'data-optional="true"'/'data-optional=true'/g;
  s/&&<\/cline>/&amp;&amp;<\/cline>/g;
  s/"<(\/?(sup|q))>"/"&lt;$1>"/g;
  s{\[<q>, </q>, </q>\]}{[&lt;q>, &lt;/q>, &lt;/q>]}g;
  s/i <"/i &lt;"/g;
  s/"<img /"&lt; /g;
  s/<br>/<br\/>/g;

  print;
}
