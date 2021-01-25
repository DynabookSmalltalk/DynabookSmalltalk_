reading
readOop
	"Read an oop and map it to an object:
		- The oop may be immediate in which case its tag indicates its class and the remeaining bits its value.
		- the oop may have its top bit set in which case it is an index into the outPointers
		- otherwise the oop is a byte offset from the start of the first object in the segment and is in oopMap"
	| oop topBit |
	oop := self readUint32.
	topBit := oop bitShift: -31.
	^(oop bitAnd: 3) caseOf: {
		[0]	->	[topBit = 1
					ifTrue: [outPointers at: oop - 16r80000000 / 4 + 1]
					ifFalse: [oopMap at: oop]].
		[1] ->	[(oop bitShift: -1) - (topBit = 1 ifTrue: [16r80000000] ifFalse: [0])].
		[3] ->	[(oop bitShift: -1) - (topBit = 1 ifTrue: [16r80000000] ifFalse: [0])].
		[2] ->	[Character value: (oop bitShift: -2)]}