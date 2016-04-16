#!~/.rakudobrew/bin/perl6
{
  my Str $var = "Text";
  say $var;
}
my Int $var = 123;
say $var;
$var = 999;
say $var;

my Int $var1 := 123;
say $var1;
#$var1 = 999;
say $var1;

say "-" x 12;

my $a;
my $b;
$b := $a;
$a = 7;
say $a, ' ', $b;

$b = 8;
say $a, ' ', $b;

my @numbers = [7, 2, 4, 9, 11, 3];
@numbers.push(99);
say @numbers;

say @numbers.sort;
say @numbers;
@numbers.=sort;
say @numbers;

my $age = 19;
if $age > 18 {
    say 'Welcome'
}

say 'Welcome 1' if $age > 10;

my $number-of-seats = 9;

if $number-of-seats <= 5 {
  say 'I ma a sedan'
}
elsif $number-of-seats <= 7 {
  say 'I am 7 seater'
}
else {
  say 'I am a van'
}

my $clean-shoes = False;

if not $clean-shoes {
  say 'Clean your shoes';
}

unless $clean-shoes {
  say 'Clean your shoes';
}

my Int $var = 1;
with $var {
  say 'Hello';
}

my Int $var2;
with $var2 {
  say 'Hello 2';
} orwith $var1 {
  say 'Hello 1';
}

my @array = [1, 2, 3];

for @array -> $array-item {
  say $array-item * 100;
}

my $var = 42;

given $var {
  when 0..50 { say 'Less than or equal to 50' }
  when Int { say 'is an Int' }
  when 42 { say 42 }
  default { say "huh?" }
}

given $var {
  when 0..50 { say 'Less than or equal to 50'; proceed; }
  when Int { say 'is an Int'; proceed; }
  when 42 { say 42; proceed; }
  default { say "huh?" }
}

loop (my $i = 0; $i < 5; ++$i ) {
  say "The current number is $i."
}

say "Hello Mam.";
say "Hello Sir.";
print "Hello Mam.";
print "Hello Sir.";

my $name;
say "Hi, what's your name?";
$name = get;
say "Dear $name, welcome to Perl 6.";

my $name = prompt("Hi, what's your name? ");
say "Dear $name, Welcome to Perl 6;-)";
