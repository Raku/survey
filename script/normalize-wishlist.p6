#!/usr/bin/env perl6

use v6;

use Text::CSV;

my @survey-data = csv(in => "../june2018/Perl6 User Survey.csv" );


my Int $speed = 0;
for @survey-data -> $data {
    if $data[24] ~~ / ( <[Ff]>ast | <[Ss]>peed | <[Pp]>erform ) / {
        $speed++;
    }
}


