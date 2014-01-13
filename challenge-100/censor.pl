#!/usr/bin/env perl
use strict;
use warnings;

open(my $wordfile,  "<",  $ARGV[0]) or die "Can't open file at ARGV[0] $ARGV[0]: $!";
my @wordlist = <$wordfile>;

while (my $input = <STDIN>){
	my $lowercase_input = lc($input);
	#my @tokens = split(/\s+/); # splits the string at $_ by the 'space' delimeter
	foreach (@wordlist) {
		s/[\s\n]+$//; # removes any trailing instances of 'space' or 'newline' from $_
		my $index_found = index($lowercase_input, lc);
		if ($index_found != -1){
			print "contains $_";
		}
	}
}

close $wordfile or die "$wordfile: $!";