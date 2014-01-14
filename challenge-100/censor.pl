#!/usr/bin/env perl
use strict;
use warnings;

open(my $wordfile,  "<",  $ARGV[0]) or die "Can't open file $ARGV[0]: $!";
my @wordlist = <$wordfile>;

while (my $input = <STDIN>){	#read file line by line to $input
	
	foreach (@wordlist) {
		s/[\s\n]+$//;  # removes trailing 'space' or 'newline' instances from $_

		while ($input =~ m/\Q$_/gi) { # ignore case, match all (escaped) $_ in input
			my $censor_length = length($_) - 1;
			# replace '*'s at match start posn ($-[0]) + 1 to preserve first letter
			substr $input, $-[0]+1, $censor_length, ('*' x $censor_length);
		}
	}

	print "$input";
}

close $wordfile or die "$wordfile: $!";