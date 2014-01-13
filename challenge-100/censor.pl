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
		my $search_string = quotemeta(lc);
		$input =~ s/$search_string/'*' x length($search_string)/ge;
		#while ($input =~ m/$search_string/g) {
			#print "Found '$&'.  Next attempt at character " . pos($input) . "Other thing: " . $-[0]. "\n";
		#	print "Found '$&' at: " . $-[0]. "\n";
		#}
		#my $index_found = index($lowercase_input, lc);
		#if ($index_found != -1){

		#	$input =~ 
		#	print "contains $_";
		#}
	}
	print "$input";
}

close $wordfile or die "$wordfile: $!";