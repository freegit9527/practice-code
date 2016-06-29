#!perl

use strict;
use warnings;
use utf8;
use 5.014;

sub createNode {
    my $node = {};
    $node->{VALUE} = $_[0];
    $node->{LEFT} = $node->{RIGHT} = undef;
    $node;
}

sub findLCA {
    # accept 3 arguments:
    # 1.node; 2. n1 value; 3. n2 value
    my($root, $n1, $n2) = @_;
    return undef unless ($root);
    return $root if ($n1 == $root->{VALUE} ||
                     $n2 == $root->{VALUE});
    my($left, $right) =
        (findLCA($root->{LEFT}, $n1, $n2),
         findLCA($root->{RIGHT}, $n1, $n2));
    return $root if ($left && $right);
    $left || $right;
}

my ($root, $n);
$root = createNode(1);

$root->{LEFT} = createNode(2);
$root->{RIGHT} = createNode(3);

$root->{LEFT}{LEFT} = createNode(4);
$root->{LEFT}{RIGHT} = createNode(5);

$root->{RIGHT}{LEFT} = createNode(6);
$root->{RIGHT}{RIGHT} = createNode(7);

print "LCA(4, 5) = ", findLCA($root, 4, 5)->{VALUE}, "\n";
print "LCA(4, 6) = ", findLCA($root, 4, 6)->{VALUE}, "\n";
print "LCA(3, 4) = ", findLCA($root, 3, 4)->{VALUE}, "\n";
print "LCA(2, 4) = ", findLCA($root, 2, 4)->{VALUE}, "\n";
