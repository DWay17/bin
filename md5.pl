#!/bin/perl -w
use strict;
use warnings;
#use Digest::MD5 qw(md5_hex);
use Digest::MD5 qw(md5 md5_hex md5_base64);
#use String::Util 'trim';

sub trim($)
{
  my $string = shift;
  $string =~ s/^\s+//;
  $string =~ s/\s+$//;
  return $string;
}

my $line;
foreach $line ( <STDIN> ) {
	print trim($line) . "\t" . Digest::MD5::md5_hex($line) . "\t" . Digest::MD5::md5_hex(trim($line)); 
};

