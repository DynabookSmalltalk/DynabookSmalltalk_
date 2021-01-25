*Nebraska
getInteger32: location
	"Read a SmallInteger stored in the receiver using big-endian one's complement representation. Avoid creation of LargeIntegers."

	| firstByte |
	(firstByte := self byteAt: location) < 64 ifTrue: [ 
		^(((((
			firstByte bitShift: 8) bitOr:
			(self byteAt: location + 1)) bitShift: 8) bitOr: 
			(self byteAt: location + 2)) bitShift: 8) bitOr: 
			(self byteAt: location + 3) ].
	^(64 - firstByte bitShift: 24) - (((((
		(self byteAt: location + 1)) bitShift: 8) bitOr: 
		(self byteAt: location + 2)) bitShift: 8) bitOr: 
		(self byteAt: location + 3))
