mathematical functions
sqrtFloor
	"See super. Use asFloat sqrt which is known to be exactly rounded.
	Adjust the result in case self asFloat is inexact.
	An example why it is necessary with 60 bits SmallInteger is:
		| i |
		i := (1<<28-1) squared - 1.
		i asFloat sqrt truncated squared <= i.
	What happens is that i and and next perfect square above i, s^2
	are rounded to the same Float f >= s^2.
	In other words, asFloat did cross the next perfect square boundary.
	The guess is at most off by 1, because the next next perfect square is:
		(s + 1) squared = (2*s + s squared + 1)
	s squared has at most 60 bits, and 2*s has 31 bits in this case,
	s squared highBit - (2*s) highBit < Float precision,
	so we are sure that next next perfect square is a different Float."

	| guess |
	guess := self asFloat sqrt truncated.
	guess * guess > self ifTrue: [^guess - 1].
	^guess