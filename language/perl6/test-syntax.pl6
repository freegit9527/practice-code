#!~/.rakudobrew/bin/perl6

my $var = "hello";
say "var exists" if defined($var);

sub whether-defined($variable) {
  if defined($variable) {
    say "\$$variable defined";
    say $variable.WHAT;
    say "\$variable = $variable";
  }
}

whether-defined($var);
#whether-defined($var-v1);

my $num = 111;
whether-defined($num);
