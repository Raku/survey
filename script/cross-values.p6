#!/usr/bin/env perl6

use v6;

use Text::CSV;


sub MAIN( $column1 = 2, $column2 = 4, $column-name1= "Perl 5 user?", $column-name2 = "Age group" ) {
    my @survey-data = csv(in => "../june2018/Perl6 User Survey.csv" );

    my %cross;
    my $node-set;
    for @survey-data[1..*] -> $line {
        my $val1 = "$line[$column1] ($column-name1)";
        my $val2 = "$line[$column2] ($column-name2)";
        $node-set ∪= $val1;
        $node-set ∪= $val2;
        %cross{$val1}{$val2}++;
    }

    say "*Vertices ", $node-set.elems;

    my %inverse-mapping;
    my $idx = 0;
    for $node-set.keys.sort( { ( $^b ~~ /(\d+)/ ) <=> ( $^a ~~ / (\d+) /) } ) -> $val {
        ++$idx;
        %inverse-mapping{$val} = $idx;
        say "$idx \"$val\"";
    }

    say "*arcs";
    for %cross.kv -> $key, $links {
        for $links.kv -> $target, $value {
	    say "%inverse-mapping{$key} %inverse-mapping{$target} $value ";
        }
    }
}



