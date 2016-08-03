"Hello World".postln;

{SinOsc.ar}.play;

s.volume.gui;

(
{
	SinOsc.ar(LFNoise0.kr(10).range(500, 1500),mul:0.1)
}.play;
)

// like the sound of water drop
(
{
	RLPF.ar(Dust.ar([1, 5]),
	LFNoise1.ar([1, 2]).range(100, 3000), 0.02)
}.play;
)

// like the sound of raining
(
{
	RLPF.ar(Dust.ar([12, 1]),
	LFNoise1.ar([0.1, 0.1]).range(500, 2000), 0.2)
}.play;
)

(
100.do(
	{"Print this line over and over...".scramble.postln}
);
)

// use [cmd+shift+p] to clean the `Post window'

(
// QUICK RECORD
s.record;

{
	RLPF.ar(Dust.ar([1, 5]),
	LFNoise1.ar([1, 2]).range(100, 3000), 0.02)
}.play;

s.stopRecording;
s.makeWindow;
)

// Variables

x = 10;
y = 660;
y;
x;
x + y;
y - x;

