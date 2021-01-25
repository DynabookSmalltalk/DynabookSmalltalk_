I represent a 32-bit register. An instance of me can hold any non-negative integer in the range [0..(2^32 - 1)]. Operations are performed on my contents in place, like a hardware register, and results are always modulo 2^32. All operations avoid LargeInteger arithmetic as much as possible.

I'm mainly used by the SecureHashAlgorithm class, but I can be used for implementing other algorithms designed for 32-bit arithmetic. For examble George Marsaglia's Xorshift PRNG from http://www.jstatsoft.org/v08/i14/paper :

"Internal state."
x := ThirtyTwoBitRegister fromInteger: 123456789.
y := ThirtyTwoBitRegister fromInteger: 362436069.
z := ThirtyTwoBitRegister fromInteger: 521288629.
w := ThirtyTwoBitRegister fromInteger: 88675123.
"Temporaries."
t := ThirtyTwoBitRegister new.
temp := nil.
"The algorithm: t=(x^(x<<11));x=y;y=z;z=w; return( w=(w^(w>>19))ˆ(t^(t>>8)) );"
xorShift128 := [
	"t=(x^(x<<11));"
	t
		loadFrom: x;
		<< 11;
		bitXor: x.
	"x=y;y=z;z=w;"
	temp := x.
	x := y.
	y := z.
	z := w.
	"w=(w^(w>>19))ˆ(t^(t>>8))"
	w := temp.
	w
		loadFrom: z;
		>> 19;
		bitXor: z;
		bitXor: t.
	t >> 8.
	w bitXor: t.
	"Truncate to 30 bits."
	(w hi bitShift: 14) bitXor: w low ].

The code is about 9.5x faster than an implementation using LargeIntegers:

"Implementation using LargeIntegers."
x := 123456789.
y := 362436069.
z := 521288629.
w := 88675123.
largeIntegerXorShift128 := [
	| t |
	t := ((x bitAnd: 16r1FFFFF) bitShift: 11) bitXor: x.
	x := y.
	y := z.
	z := w.
	w := (((w bitShift: -19) bitXor: w) bitXor: t) bitXor: (t bitShift: -8) ].

xorShift128 bench. '4,990,000 per second. 201 nanoseconds per run.'.
largeIntegerXorShift128 bench. '529,000 per second. 1.89 microseconds per run.'.