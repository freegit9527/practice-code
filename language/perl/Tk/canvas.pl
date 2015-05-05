#!/usr/bin/env perl 
#===============================================================================
#         FILE: canvas.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/05/2015 08:27:40 AM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use Tk;

my $mw = MainWindow->new;

my $canvas = $mw->Canvas;

$canvas->pack(
    -expand => 1,
    -fill => 'both'
);

create_item($canvas, 1, 1, 'circle', 'blue', 'Jane');
create_item($canvas, 4, 4, 'circle', 'red', 'Peter');
create_item($canvas, 4, 1, 'square', 'blue', 'James');
create_item($canvas, 1, 4, 'square', 'blue', 'Patricia');

$canvas->bind(
    'circle',
    '<1>' => sub 
    {
        handle_circle($canvas)
    }
);

$canvas->bind(
    'blue',
    '<Double-1>' => sub 
    {
        handle_blue($canvas)
    }
);

MainLoop;

sub create_item 
{
    my ($can, $x, $y, $form, $color, $name) = @_;

    my $x2 = $x + 1;
    my $y2 = $y + 1;
    my $kind;

    if ($form eq 'circle') 
    {
        $kind = 'oval';
    }

    if ($form eq 'square')
    {
        $kind = 'rectangle';
    }

    $can->create (
        ($kind, "$x" . 'c', "$y" . 'c', "$x2" . 'c', "$y2" . 'c'),
        -tags => [$form, $color, $name],
        -fill => $color
    );
}

sub get_name 
{
    my ($can) = @_;

    my $item = $can->find('withtag', 'current');
    my @taglist = $can->gettags($item);

    my $name;
    for (@taglist)
    {
        if ($_ eq 'current') 
        {
            next;
        }
        if ($_ eq 'red' or $_ eq 'blue')
        {
            next;
        }
        if ($_ eq 'square' or $_ eq 'circle')
        {
            next;
        }
        $name = $_;
        last;
    }
    return $name;
}


sub handle_circle
{
    my ($can) = @_;

    my $name = get_name($can);
    print "Action on circle $name...\n";
}


sub handle_blue
{
    my ($can) = @_;

    my $name = get_name($can);

    print "Action on blue item $name...\n";
}


