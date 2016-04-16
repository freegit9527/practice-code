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

$var = 1;
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

$var = 42;

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
#$name = get;
$name = "snow";
say "Dear $name, welcome to Perl 6.";

#$name = prompt("Hi, what's your name? ");
say "Dear $name, Welcome to Perl 6;-)";

$name = 'Neo';
run 'echo', "Hello $name";
shell "ls -la";

my $data = slurp "datafile.txt";
say $data;

my $newdata = "New scores:
Paul 10
Paulie 9
Paulo 11";

spurt "newdatafile.txt", $newdata;

say dir;
mkdir "newfolder";
say dir "newfolder/";

say "script123.pl6".IO.e;
say "folder123".IO.e;

mkdir "folder123";
spurt "script123.pl6", "";
say "script123.pl6".IO.d;
say "folder123".IO.d;

say "script123.pl6".IO.f;
say "folder123".IO.f;

## 7. Subroutines

sub alien-greeting {
  say "Hello earthlings.";
}

alien-greeting;

sub say-hello (Str $name) {
  say "Hello " ~ $name ~ "!" x 4;
}

say-hello "Paul";
say-hello "Paula";

multi greet ($name) {
  say "Good morning $name";
}

multi greet ($name, $title) {
  say "Good morning $title $name";
}

greet "Johnnie";
greet "Laura", "Mrs.";

sub say-hello-optional($name?) {
  with $name {
    say "Hello " ~ $name ~ ".";
  } else {
    say "Hello Human.";
  }
}

say-hello-optional;
say-hello-optional("Laura");

sub say-hello-default ($name = "Matt") {
  say "Hello " ~ $name ~ ".";
}

say-hello-default;
say-hello-default("Laura");

## 8. Functional Programming


