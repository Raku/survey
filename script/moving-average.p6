#!/usr/bin/env perl6

use v6;

use Text::CSV;


sub MAIN( $column = 22 ) {
    my @survey-data = csv(in => "../june2018/Perl6 User Survey.csv" );

    say "Average";
    for @survey-data[1..*-31].kv -> $idx, $line {
        my @window = @survey-data[$idx+1..$idx+31].map: *.[$column];
        say ([+] @window )/ @window.elems;
    }

}



