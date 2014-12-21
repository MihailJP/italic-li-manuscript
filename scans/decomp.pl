#!/usr/bin/perl

use strict; use Imager; use POSIX;

die "Usage: $0 source-file\n" unless $ARGV[0];

my $Top = 157;
my $Left = 106;
my $Width = 146.53;
my $Height = 146.67;
my $xInterval = 42;
my $yInterval = 101;

(my $target_dir = $ARGV[0]) =~ s/\.[^\.\/\\]*$//;

my $source_img = Imager->new();
$source_img->read(file=>$ARGV[0]) or die $source_img->errstr;

my $filenum = 0;
for (my $y=$Top; $y < ($source_img->getheight - $Height); $y += $Height + $yInterval) {
	for (my $x=$Left; $x < ($source_img->getwidth - $Width); $x += $Width + $xInterval) {
		my $decomposed = $source_img->crop(left=>floor($x),
		                                   right=>floor($x+$Width),
		                                   top=>floor($y),
		                                   bottom=>floor($y+$Height));
		$decomposed->write(file=>sprintf("%s/%05d.bmp", $target_dir, $filenum++)) or die $decomposed->errstr;
	}
}
