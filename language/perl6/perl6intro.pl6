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

say "exists" with @array;

@array = <1 2 3 4 5>;
sub squared($x) {
  $x ** 2;
}

say map(&squared, @array);

say map(-> $x {$x ** 2}, @array);

my $squared = -> $x {
  $x ** 2;
}
say $squared(9);

# two argumens for lambda ;-)
my $squared-two = -> $x, $y {
  $x ** 2 + $y ** 2;
}
say $squared-two(10, 11);

@array = <7 8 9 0 1 2 4 3 5 6 7 8 9>;
my @final-array = reverse(sort(unique(@array)));
say @final-array;

@final-array = @array.unique.sort.reverse;
say @final-array;

@array ==> unique()
       ==> sort()
       ==> reverse()
       ==> my @final-array-v1;

say @final-array-v1;

my @final-array-v2 <== reverse()
                   <== sort()
                   <== unique()
                   <== @array;
say @final-array-v2;

@array = <0 1 2 3 4 5 6 7 8 9 10>;
sub is-even ($var) { $var %% 2 };

say @array>>.is-prime;
say @array>>.&is-even;

with $var {
  say "var exits";
  say $var.WHAT;
}

sub whether-defined($var) {
  say "var exists, var = $var";
  say $var.WHAT;
}

whether-defined($var) if defined($var);

$var = 2;
if $var == 1 | 2 | 3 {
  say "The variable is 1 or 2 or 3.";
}

my $lazylist = (1 ... 10);
say $lazylist;

$lazylist = (1 ... Inf);
say $lazylist;

$lazylist = (0, 2 ... 10);
say $lazylist;

$lazylist = (0, {$_ + 3} ... 12);
say $lazylist;

$lazylist = (0, {$_ + 3} ... 10);
say $lazylist;

$lazylist = (0, {$_ + 3} ...^ * > 10);
say $lazylist;

# 9. Classes & Objects

class Human {
  has $!name;
  has $.age;
  has $!sex;
  has $!nationality;

  method new ($name, $age, $sex, $nationality) {
    self.bless(:$name, :$age, :$sex, :$nationality);
  }
}

#my $john = Human.new(name => 'John',
#                      age => 23, 
#                      sex => 'M',
#                      nationality => 'American');
my $john = Human.new('John', 23, 'M', 'American');

say $john;

whether-defined($var) if defined $var;

$var = 7;
say $var;

$var = 7;
sub sayvar {
  $var;
}
say sayvar;

say $john.age;
my $bob = Human.new('John', 23, 'F', 'China');
say $bob;

class Human1 {
  has $.name;
  has $.age;
  has $.sex;
  has $.nationality;
  has $.eligible;

  method access-eligibility {
    if self.age < 21 {
      $!eligible = 'No';
    } else {
      $!eligible = 'Yes';
    }
    self!iamprivate;
  }

  method !iamprivate {
    say "I am private";
  }
}

$john = Human1.new(name => 'John', age => 23, 
                sex => 'M', nationality => 'China');
$john.access-eligibility;
say $john.eligible;
say $john;

class Human2 {
  has $.name;
  my $.counter = 0;
  method new ($name) {
    Human2.counter++;
    self.bless(:$name);
  }
}

whether-defined($a) if defined $a;
whether-defined($b) if defined $b;

$a = Human2.new('a');
$b = Human2.new('b');

say Human2.counter;
say $a.name;
say $b.name;


