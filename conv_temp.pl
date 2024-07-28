#!/usr/bin/perl
use strict;
use warnings;

print "Entrez une température (par ex. 32F, 100C):\n";
my $input = <STDIN>;
chomp($input);

if ($input =~ m/^([-+]?[0-9]+(?:(\.|,)[0-9]*)?)\s*([CF])$/i)
{         
    my $InputNum = $1;
    my $type = $3;
    my $celsius = $InputNum;
    my $fahrnheit = $InputNum;
    #$punct =~ s/,/\./;
    $InputNum =~ s/,/\./;
    if ($type =~ m/c/i) {
        $celsius = $InputNum;
        $fahrnheit = ($celsius * 9 / 5) + 32;
        printf "%.2f C = %.2f F\n", $celsius, $fahrnheit;
    } else {
        $fahrnheit = $InputNum;
        $celsius = ($fahrnheit - 32) * 5 / 9;
        printf "%.2f F = %.2f C\n", $fahrnheit, $celsius;
    }
    
} else {
    print "J'attends un nombre suivi de \"C\" ou \"F\",\n";
    print "donc je ne comprends pas \"$input\",\n";
    }
        
    


