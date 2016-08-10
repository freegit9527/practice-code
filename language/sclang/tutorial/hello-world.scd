// 2016/08/03

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

// 2016/08/04

3.cubed;

x = 4.cubed;
x;

(
var number;
number = 5.cubed;
)

~number = 233;
~number;


(
var foo;
foo = 3;
foo = foo.cubed;
foo = foo + 100;
foo = foo / 2;
foo;
)

3.cubed + 100 / 2;

s;
s.quit;
s.boot;

x = { SinOsc.ar }.play;
x.free;

x = { SinOsc.ar };
y = x.play;
y.free;

x = { SinOsc.ar(700) * 0.125 }.play;
x.free;

(
z = {
	arg freq = 440, amp = 1;
	var sig;
	sig = SinOsc.ar(freq) * amp;
}.play;
)

z.set(\freq, 330);
z.set(\amp, 0.125);
z.set(\freq, 660, \amp, 1);
z.set(\amp, 0.125, \freq, 550);
z.free;

(
z = {
	var freq, sig;
	freq = LFNoise0.kr(8, 400, 600).range(200, 1000);
	sig = SinOsc.ar(freq);
}.play;
)

z.free;

// 2016/08/04 17:29:52 PM

x = {Pan2.ar(SinOsc.ar(440, 0, 0.1), 0.0)}.play;
x.free;

{Pan2.ar(SinOsc.ar(MouseX.kr(440, 880), 0, 0.1), 0.0)}.play;

(
{
	var n = 11;
	Resonz.ar(
		Mix.fill(n, {
			var freq = rrand(50, 560.3);
			var numcps = rrand(2, 20);
			Pan2.ar(Gendy1.ar(6.rand, 6.rand, 1.0.rand,
				1.0.rand, freq, freq, 1.0.rand, 1.0.rand,
				numcps, SinOsc.kr(exprand(0.02, 0.2), 0, numcps/2,
					numcps/2
				), 0.5/(n.sqrt)
			), 1.0.rand2)
		}),
		MouseX.kr(100, 2000),
		MouseY.kr(0.01, 1.0)
	);
}.play
)

{Pan2.ar(SinOsc.ar(440, 0, 0.1), 0.0)}.play;

(
{
	SinOsc.ar(440, 0, 0.1) + Pulse.ar(443, 0.6, 0.05)
}.play;
)

(
if (4 == 4, {
	if (3 == 3, {
		"correct!".postln;
	});
});
)

2.postln;

Post << [2, 3, 4, 5] << nl;

(
var freq;

freq = rrand(300, 600);
{SinOsc.ar(freq, 0, 0.1)}.play;
)

{SinOsc.ar(MouseX.kr(400, 800), 0, 0.1)}.play;

"ls -l".unixCmd;