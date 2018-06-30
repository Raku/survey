#!/usr/bin/env perl6

use v6;

use Text::CSV;


sub MAIN( $column1 = 2, $column2 = 4 ) {
    my @survey-data = csv(in => "../june2018/Perl6 User Survey.csv" );

    my %cross;
    my $node-set;
    for @survey-data[1..*] -> $line {
        $node-set ∪= $line[$column1];
        $node-set ∪= $line[$column2];
        %cross{$line[$column1]}{$line[$column2]}++;
    }

    say "*Vertices ", $node-set.elems;

    my %inverse-mapping;
    my $idx = 0;
    for $node-set.keys -> $val {
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



