#!perl

use strict;
use warnings;
use utf8;
use 5.014;

# insert given value into the proper position. If no tree provided,
# use implicit pass by reference aspect of @_ to fill one.
sub insert {
    my($tree, $value) = @_;
    unless ($tree) {
        $tree = {};
        $tree->{VALUE} = $value;
        $tree->{LEFT} = undef;
        $tree->{RIGHT} = undef;
        $_[0] = $tree; # $_[0] is reference param
        return;
    }
    if ($tree->{VALUE} > $value) { insert($tree->{LEFT}, $value) }
    elsif ($tree->{VALUE} < $value) { insert($tree->{RIGHT}, $value) }
    else { warn "duplicate insert of $value\n" }
}

sub in_order {
    my($tree) = @_;
    return unless $tree;
    in_order($tree->{LEFT});
    print $tree->{VALUE}, " ";
    in_order($tree->{RIGHT});
}

sub pre_order {
    my($tree) = @_;
    return unless $tree;
    print $tree->{VALUE}, " ";
    pre_order($tree->{LEFT});
    pre_order($tree->{RIGHT});
}

sub post_order {
    my($tree) = @_;
    return unless $tree;
    post_order($tree->{LEFT});
    post_order($tree->{RIGHT});
    print $tree->{VALUE}, " ";
}

sub search {
    my($tree, $value) = @_;
    return unless $tree;
    return $tree if ($tree->{VALUE} == $value);
    search ($tree->{ ($value < $tree->{VALUE}) ? "LEFT" : "RIGHT" }, $value)
}

my($root, $n);
insert($root, int(rand(100))) while ($n++ < 5);
print "Pre order:  "; pre_order($root); print "\n";
print "In order:   "; in_order($root); print "\n";
print "Post order: "; post_order($root); print "\n";

# prompt until EOF
for (print "Search? "; <>; print "Search? ") {
    chomp;
    my $found = search($root, $_);
    if ($found) { print "Found $_ at $found, $found->{VALUE}\n" }
    else { print "No $_ in the tree.\n" }
}
