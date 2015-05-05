#!/usr/bin/env perl 
#===============================================================================
#         FILE: hello.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/04/2015 06:52:14 PM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use Tk;

my $mw = MainWindow->new;

$mw->geometry("200x100");
$mw->title("Hello World!!! I am title");

$mw->Label(-text => 'Hello, World...')->pack();

$mw->Label(
    -text => "what is your name?"
)->pack(
    -side => "left"
);

$mw->Entry(
    -background => 'white',
    -foreground => 'black'
)->pack(
    -side => "right"
);

$mw->Button(
    -text    => 'Enter',
    -command => \&Enter
)->pack;


$mw->Button(
    -text    => 'Quit',
    -command => \&Quit
)->pack;

$mw->Text(
    -background => 'black',
    -foreground => 'white'
)->pack(
#    -side => "top",
    -ipadx => 20
);

$mw->Entry(
    -background => 'green',
    -foreground => 'white'
)->pack(
    -side => 'top'
);

$mw->Frame(
    -background => 'red'
)->pack(
    -ipadx => 50,
    -side => "left",
    -fill => "y"
);

$mw->Frame(
    -background => "blue"
)->pack(
    -ipadx => 50,
    -side => "right",
    -fill => "y"
);

MainLoop;

sub Enter
{
    $mw->messageBox(
        -message => "Enter is pushed",
        -type => "ok"
    );
}

sub Quit
{
    my $yesno_button = $mw->messageBox(
        -message => "Quit is pushed. Exit?",
        -type => "yesno",
        -icon => "question"
    );

    $mw->messageBox(
        -message => "You pressed $yesno_button!",
        -type => "ok"
    );

    if ($yesno_button eq "Yes")
    {
        $mw->messageBox(
            -message => "Ok, Exiting.",
            -type => "ok"
        );
        exit;
    }
    else 
    {
        $mw->messageBox(
            -message => "I did not think so either.",
            -type => "ok"
        );
    }
}
