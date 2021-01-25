*Nebraska
putInteger32: anInteger at: location
	"Store a SmallInteger in the receiver using big-endian one's complement representation. Avoid creation of LargeIntegers."
	
	| integer firstByte |
	(integer := anInteger) >= 0 
		ifTrue: [ firstByte := (anInteger bitShift: -24) bitAnd: 255 ]
		ifFalse: [
			integer := 0 - integer.
			firstByte := (integer bitShift: -24) + 64 bitAnd: 255 ].
	self 
		byteAt: location put: firstByte;
		byteAt: location + 1 put: ((integer bitShift: -16) bitAnd: 255);
		byteAt: location + 2 put: ((integer bitShift: -8) bitAnd: 255);
		byteAt: location + 3 put: (integer bitAnd: 255)
