#!/usr/bin/perl
use strict;
use warnings;

print "Entrez une température (par ex. 32F, 100C):\n";
my $input = <STDIN>; # Lecture d'une ligne de l'utilisateur
chomp($input); # Suppression du caractère de nouvelle ligne à la fin de $input
 
if ($input =~ m/^([-+]?\d+(?:(?:\.|,)\d*)?)\s*([CF])$/i) # l'opérateur =~ (bind) lie la variable $input à la regex. m/// : correspondance (pattern matching).  regex : début de ligne
# suivi 1ère paranthèse ouvrante et capturante et de - ou + optionnel, suivi d'au moins un ou pls chiffres, puis 2 parenthèses non capturantes et soit d'un point soit une virgule, puis
# entre zéro et pls chiffres, le tout optionnel. Puis zéro ou pls espaces ou tabulations enfin soi C soit F regroupés entre parenthèses - capturantes, fin de ligne et option -i ignorer la casse.
##
# On aurait pu se passer des (?: ) dans ce cas puisque la reconnaissance n'est effectuée qu'une seule fois et non de façon répétée dans une boucle. Ex: if ($input =~ m/^([-+]?\d+((\.|,)\d*)?)\s*([CF])$/i)
# et dans ce cas "my $type = $4;"
##

#if ($input =~ m/^([-+]?\d+((\.|,)\d*)?)\s*([CF])$/i)
{         
## Toutes les déclarations liées aux champs de la regex sont à faire après cette regex    
    my $InputNum = $1; # déclaration de $InputNum = $1 (réf. arrière) correspondant au 1er champ capturé ([-+]?\d+(?:(?:\.|,)\d*)?). (?:(?:\.|,)\d*) avec ses 2 "?:" limite les 2 paranthèses ouvrantes à un rôle de regroupement et empêche leur capture
    my $type = $2; # déclaration de $type = $2 correspondant au 2nd champ capturé ([CF])
    #my $type = $4;
    my $celsius = $InputNum;
    my $fahrnheit = $InputNum;
    $InputNum =~ s/,/\./; # substitution de la virgule française par un point pour les opérations de conversion
    if ($type =~ m/c/i) { # si $type correspond à c ou C. On ignore la casse.
        $celsius = $InputNum;
        $fahrnheit = ($celsius * 9 / 5) + 32; # Conversion °C en °F
        printf "%.2f C = %.2f F\n", $celsius, $fahrnheit; # affiche le résultat avec 2 décimales
    } else {
        $fahrnheit = $InputNum;
        $celsius = ($fahrnheit - 32) * 5 / 9; # Conversion °F en °C
        printf "%.2f F = %.2f C\n", $fahrnheit, $celsius;
    }
    
} else {
    print "J'attends un nombre suivi de \"C\" ou \"F\",\n";
    print "donc je ne comprends pas \"$input\",\n";
    }
        
    


