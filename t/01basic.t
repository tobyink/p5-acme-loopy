use v5.14;
use strict;
use Test::More tests => 1;
use Acme::Loopy;

my $sum = 0;
loop {
	$sum += ${^LOOP};
	
	loop {
		$sum += ${^LOOP};
		loop {
			$sum *= ${^LOOP};
			last if ${^LOOP} > 2;
		}
		last if ${^LOOP} > 2;
	}
	
	loop {
		$sum += ${^LOOP};
		last if ${^LOOP} > 3;
	}

	$sum += ${^LOOP};
	last if ${^LOOP} > 3;
}

is $sum, 5406614024;
