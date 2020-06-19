#!/usr/bin/env perl
use strict;
use warnings;

die "You must define at least 2 files to compare!\n" unless defined $ARGV[0] && defined $ARGV[1];
die "File $ARGV[0] does not exist!\n" unless -e $ARGV[0];
die "File $ARGV[1] does not exist!\n" unless -e $ARGV[1];

my ($file1size, $file2size) = (-s $ARGV[0], -s $ARGV[1]);

printf "FILESIZE DIFF: %.2f%%\n", ($file1size / $file2size - 1) * -100;
