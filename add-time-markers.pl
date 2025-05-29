#!/usr/bin/env perl -i

$/ = undef;

while (<>) {
    if (!/<time /) {
        s/^(  <title>.*)$/  <time minutes="90" \/>\n$1/ms;
    }
    print;
}

__END__
