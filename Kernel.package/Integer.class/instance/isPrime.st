testing
isPrime
	"Answer true if the receiver is a prime number. See isProbablyPrime for a probabilistic
	implementation that is much faster for large integers, and that is correct to an extremely
	high statistical level of confidence (effectively deterministic)."
	
	| probe step limit |
	self <= 3 ifTrue: [ ^self >= 2 ].
	self \\ 2 = 0 ifTrue: [ ^false ].
	self \\ 3 = 0 ifTrue: [ ^false ].
	self <= 1073741823 ifFalse: [ "1 << 30 - 1. For numbers larger than this (on 64-bit platforms) #isProbablyPrime is usually quicker."
		^self isProbablyPrime ].
	probe := 5.
	step := 2. "Step will oscillate between 2 and 4 because at this point self \\ 6 is either 1 or 5."
	limit := self sqrtFloor. "On 64-bit platforms this could be written as self asFloat sqrt truncated (+ 1), which is faster because it creates no intermediate objects. Knowing that self has at most 30 bits because of the check above, this value will never be larger than 32767."
	[ probe <= limit ] whileTrue: [
		self \\ probe = 0 ifTrue: [ ^false ].
		probe := probe + step.
		step := 6 - step ].
	^true