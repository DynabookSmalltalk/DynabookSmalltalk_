private
hashFunction: i of: x with: y with: z using: t1 and: t2
	"Compute the hash function for the i-th step of the block hash loop. We number our steps 1-80, versus the 0-79 of the standard."
	"Details: There are four functions, one for each 20 iterations. The second and fourth are the same."

	t1 loadFrom: x.
	i <= 20 ifTrue: [
		t2
			loadFrom: x;
			bitInvert;
			bitAnd: z.
		^t1
			bitAnd: y;
			bitOr: t2 ].
	i <= 40 ifTrue: [
		^t1
			bitXor: y;
			bitXor: z ].
	i <= 60 ifTrue: [
		t2
			loadFrom: x;
			bitOr: y;
			bitAnd: z.
		^t1
			bitAnd: y;
			bitOr: t2 ].
	^t1
		bitXor: y;
		bitXor: z
