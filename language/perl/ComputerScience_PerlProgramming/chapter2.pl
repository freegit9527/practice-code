#!/usr/bin/perl
@colors = ("red", "green", "blue");
$" = ' and ';
print "Primary colors are: @colors\n";
$colors[0] = "pink";
$\ = "\n";
print $colors[0];

$size_before = @colors;
print "colors[5] = $colors[5]";
$size_after = @colors;
print "$size_before $size_after";

$size_before = @colors;
$colors[5] = "burgundy";
$size_after = @colors;
print "$size_before $size_after";

