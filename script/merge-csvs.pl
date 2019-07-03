#!/usr/bin/env perl

use strict;
use warnings;

use Text::CSV qw(csv);


my $data_1 = csv(in => $ARGV[0] );
my $data_2 = csv(in => $ARGV[1] );

my (%first_column_names, %column_names);

my $idx = 0;
for my $i ( @{$data_1->[0]} ) {
  $first_column_names{ $i } = $idx++;
}

$idx = 0;
for my $j ( @{$data_2->[0]} ) {
  if ( $first_column_names{$j} ) {
    $column_names{ $idx } = $first_column_names{$j};
  }
  $idx++;
}


my ($first_name) = $ARGV[0] =~ /(\d+)\//;
my (second_name) = $ARGV[1] =~ /(\d+)\//;



# for @first-data -> $row {
#     say $first-name, ", ", $row{ @common-columns }.join(", " );
# }

# for @second-data -> $row {
#     say $second-name, ", ", $row{ @common-columns }.join(", " );
# }


