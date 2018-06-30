#!/usr/bin/env perl6

use v6;

use Text::CSV;

my @survey-data = csv(in => "../june2018/Perl6 User Survey.csv" );


my Int $speed = 0;
my $lines= @survey-data.elems -1 ;
my @doc-score;
my @community-score;
for @survey-data[1..*] -> $data {
    if $data[24] ~~ / ( <[Ff]>ast | <[Ss]>peed | <[Pp]>erform ) / {
        $speed++;
    }
    @doc-score.push: $data[22];
    @community-score.push: $data[23];
}
say @doc-score;
say @community-score;
say "Speed mentioned $speed times or in a { 100*$speed / $lines }% of answers";
say "Documentation score ", ( [+] @doc-score ) / @doc-score.elems;
say "Community score ", ( [+] @community-score ) / @community-score.elems;


