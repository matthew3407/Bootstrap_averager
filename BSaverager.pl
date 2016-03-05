#!/opt/local/bin/perl

use strict;
use feature qw(say);
use List::Util 'sum';

my @BS;
my $total;

print "File: ";
my $filename = <STDIN>;
chomp $filename;
open(my $fh, '<:encoding(UTF-8)', $filename)
	or die "Could not open file '$filename' $!";

while (my $newick = <$fh>)
	{
		chomp $newick;
		#print "$newick\n";
	
		while ($newick =~ /\)([0-9]{1,3}):[0-9]/g){push @BS, "$1";}
		
		print "@BS";
		sub average {
			my @BS = @_;
			my $sum;
			foreach (@BS){$sum += $_;}
			return $sum/@BS;}
		say average(@BS);
		
	}
	