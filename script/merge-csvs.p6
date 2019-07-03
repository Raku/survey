#!/usr/bin/env perl6

use v6;

use Text::CSV;


my @first-data = csv(in => @*ARGS[0] );
my @second-data = csv(in => @*ARGS[1] );

my @common-columns = @first-data.column_names ∩ @second-data.column_names

my $first-name = @*ARGS[0].split("/")[0];
my $second-name = @*ARGS[0].split("/")[0];

say "Category,", @common-columns.join(", ");

for @first-data -> $row {
    say $first-name, ", ", $row{ @common-columns }.join(", " );
}

for @second-data -> $row {
    say $second-name, ", ", $row{ @common-columns }.join(", " );
}


