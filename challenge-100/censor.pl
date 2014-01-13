#!/usr/bin/env perl
use strict;
use warnings;

open(my $wordfile,  "<",  $ARGV[0]) or die "Can't open file $ARGV[0]: $!";
my @wordlist = <$wordfile>;

while (my $input = <STDIN>){
	my $lowercase_input = lc($input);
	foreach (@wordlist) {
		s/[\s\n]+$//;  # removes trailing instances of 'space' or 'newline' from $_
		my $word = quotemeta(lc);  # sets $word to lowercase, escaped version of $_
		$input =~ s/$word/'*' x length($word)/ge;
	}
	print "$input";
}

close $wordfile or die "$wordfile: $!";