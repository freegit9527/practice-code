#!/usr/bin/env perl 
#===============================================================================
#         FILE: all_in_one.pl
#       AUTHOR: Phoenix Ikki (liuxueyang.github.io), liuxueyang457@gmail.com
# ORGANIZATION: Hunan University
#      CREATED: 05/05/2015 10:23:40 AM
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use Tk;

my $mw = MainWindow->new;

$mw->geometry("500x200");
$mw->title("All-In-One Test");

my $main_frame = $mw->Frame()->pack(
    -side => 'top',
    -fill => 'x'
);

my $top_frame = $main_frame->Frame(
    -background => "red"
)->pack(
    -side => "top",
    -fill => 'x'
);

my $left_frame = $main_frame->Frame(
    -background => "black"
)->pack(
    -side => 'left',
    -fill => 'y'
);

my $right_frame = $main_frame->Frame(
    -background => "white"
)->pack(
    -side => 'right',
    -fill => 'y',
);

$top_frame->Label(
    -text => "All-In-One Test!",
    -background => "red"
)->pack(
    -side => "top"
);

$left_frame->Label(
    -text => "Enter text to copy",
    -background => "black",
    -foreground => "yellow"
)->pack(
    -side => "left"
);

my $copy_entry = $left_frame->Entry(
    -background => "white",
    -foreground => "red"
)->pack(
    -side => "left"
);

my $copy_button = $left_frame->Button(
    -text => "Copy text",
    -command => \&copy_entry_fun
)->pack(
    -side => "right"
);

my $clear_text = $right_frame->Button(
    -text => "Clear Text",
    -command => \&clear_entry
)->pack(
    -side => "top"
);

my $paste_text = $right_frame->Text(
    -background => "white",
    -foreground => "black"
)->pack(
    -side => "top"
);

sub clear_entry
{
    $paste_text->delete('0.0', 'end')
}

sub copy_entry_fun
{
    my $copied_text = $copy_entry->get();
    my $num = 100;
    my $cnt = 5;
    while ($cnt > 0) {
        my $test_str = sprintf("a-b-c-d" . "-e-f" . $num . "\n");
        $paste_text->insert("end", $test_str);
        $cnt -= 1;
#        sleep(2);
    }
    $paste_text->insert("end", $copied_text);
}

MainLoop;
