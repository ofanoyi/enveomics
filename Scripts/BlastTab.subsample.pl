#!/usr/bin/perl

#
# @author: Luis M Rodriguez-R <lmrodriguezr at gmail dot com>
# @license: artistic license 2.0
#

use strict;
use warnings;

my($blast, $fasta) = @ARGV;
($blast and $fasta) or die "
Description:
   Filters a BLAST output including only the hits produced by
   any of the given sequences as query.

Usage:
   $0 blast.tab sample.fa > out.tab

   blast.tab	BLAST output to be filtered (tabular format).
   sample.fa	Sequences to use as query.
   out.tab	The filtered BLAST output (tabular format).

";

print STDERR "== Reading sequences\n";
my $seq = {};
open FASTA, "<", $fasta or die "Cannot read the file: $fasta: $!\n";
#%$seq = map { s/^>(.*)[\n\r]*$/$1/ => 1 } grep { /^>/ } <FASTA>;
while(<FASTA>){
   next unless /^>(.*)[\n\r]*$/;
   $seq->{$1} = 1;
}
close FASTA;
print STDERR " ".(scalar keys %$seq)." sequences to be used as query.\n";

print STDERR "== Reading BLAST\n";
my ($N,$n)=(0,0);
open BLAST, "<", $blast or die "Cannot read the file: $blast: $!\n";
while(my $ln = <BLAST>){
   next if $ln=~/^#/;
   $N++; my ($qry) = split /\t/, $ln;
   next unless exists $seq->{$qry};
   $n++; print $ln;
}
close BLAST;
print STDERR " Reported $n entries out of $N.\n";

