#!/usr/bin/env perl6

use v6;

use Text::CSV;


my @survey-data = csv(in => "../june2018/Perl6 User Survey.csv" );

my $idx = 0;
for @survey-data[0].list -> $q {
    say "{$idx++}, $q";
}


