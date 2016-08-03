// chapter 0 to 4
/////////////////////////////////////////

"Hello World!".postln;

(
	"Call me.".postln;
	"Ishmael.".postln;
)

s.quit;
s.boot;


{[SinOsc.ar(440, 0, 0.2), SinOsc.ar(442, 0, 0.2)]}.play;

f = { "Function evaluated".postln; };

f;
f.value;

g = { "Evaluating...".postln; 2 + 3; }; // function name must a character?
g.value;

g = 3;
g.value;

f = { 3.0.rand; }
f.value;

f = { arg a; a.value + 3 };
f.value(3);

g = { 3.0.rand; };

f.value(g);

(
f = { arg a, b;
	a - b;
};
f.value(5, 3);
)

f = { arg a, b; a / b; }
f.value(10, 2);
f.value(b: 2, a: 10);

f = { arg a, b, c, d; (a + b) * c - d };
f.value(2, c: 3, b: 4, d: 1);

f = 2 - 3 * 2; // no operator precedence... :-(

f = { arg a, b = 2; a + b };
f.value(2);

f = { arg a, b;	a + b; };

(g = { |a, b|
	a + b;	a - b;};
)

f.value(2, 3);
g.value(2, 3);


(
f = { |a, b|
	var firstResult, finalResult;
	firstResult = a + b;
	finalResult = firstResult * 2;
	finalResult;
};
f.value(2, 3);
)

(
var myFunc;
myFunc = { |input|
	input.postln;
};
myFunc.value("foo");
myFunc.value("bar");
)

// chapter 5.
////////////////////////////////////////////

{ SinOsc.ar(440, 0, 0.2) }.play;
{ SinOsc.ar(440, 0) }.play;

(
{
	var ampOsc;
	ampOsc = SinOsc.kr(0.5, 1.5pi, 0.5, 0.5);
	SinOsc.ar(440, 0, ampOsc);
}.play;
)

// chapter 6.
////////////////////////////////////////////

{ [SinOsc.ar(440, 0, 0.2), SinOsc.ar(442, 0, 0.2)] }.play;

a = ["foo", "bar"];
a.at(0);
a.at(1);
a.at(2);

a[0];

{ SinOsc.ar([440, 442], 0, 0.2) }.play;

(
{
	var freq;
	freq = [[660, 880], [440, 660], 1320, 880].choose;
	SinOsc.ar(freq, 0, 0.2);
}.play;
)

{ Pan2.ar(PinkNoise.ar(1), SinOsc.kr(0.5)) }.play;

{ PinkNoise.ar(1) }.play;

// chapter 7.
////////////////////////////////////////////

{ PinkNoise.ar(0.2) + SinOsc.ar(440, 0, 0.2) + Saw.ar(660, 0.2) }.play;

{ Mix.new([SinOsc.ar(440, 0, 0.2), Saw.ar(660, 0, 0.2)]).postln }.play;

// combine two stereo arrays
(
{
	var a, b;
	a = [SinOsc.ar(440, 0, 0.2), Saw.ar(662, 0.2)];
	b = [SinOsc.ar(442, 0, 0.2), Saw.ar(660, 0.2)];
	Mix([a, b]).postln;
}.play;
)

(
var n = 5;
{ Mix.fill(n, {SinOsc.ar(100 + 500.0.rand, 0, 1 / n)}) }.play;
)