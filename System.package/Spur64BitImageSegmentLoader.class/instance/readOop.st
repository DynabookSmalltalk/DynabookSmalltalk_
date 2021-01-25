reading
readOop
	"Read an oop and map it to an object:
		- The oop may be immediate in which case its tag indicates its class and the remeaining bits its value.
		- the oop may have its top bit set in which case it is an index into the outPointers
		- otherwise the oop is a byte offset from the start of the first object in the segment and is in oopMap.
	 The method is written to avoid large integer arithmetic as much as possible."
	| lo hi topBit oop |
	lo := self readUint32.
	hi := self readUint32.
	topBit := hi bitShift: -31.
	^(lo bitAnd: 7) caseOf: {
		[0]	->	[topBit = 1
					ifTrue:
						[oop := (hi - 16r80000000 bitShift: 32) + lo.
						 outPointers at: oop / 8 + 1]
					ifFalse:
						[oop := (hi bitShift: 32) + lo.
						 oopMap at: oop]].
		[1] ->	[(lo bitShift: -3) bitOr: (hi - (topBit = 1 ifTrue: [16r100000000] ifFalse: [0]) bitShift: 29)].
		[2] ->	[Character value: ((lo bitShift: -3) bitOr: (hi bitShift: 29))].
		[4] ->	[(hi = 0 and: [lo <= 15]) "+ve & -ve zero"
					ifTrue: [lo <= 7 ifTrue: [0.0] ifFalse: [-0.0]]
					ifFalse: "convert lo: | tag | sign | mantissa low 28 bits | hi: | mantissa high 24 bits | exponent - 896 |
							to hi: | mantissa high 20 bits | exponent 11 bits | sign | lo: | mantissa low 32 bits |"
						[(BoxedFloat64 basicNew: 2)
								basicAt: 1 put: ((lo bitAnd: 8) bitShift: 28) + ((hi bitShift: -4) + (896 bitShift: 20));
								basicAt: 2 put: (lo bitShift: -4) + ((hi bitAnd: 15) bitShift: 28);
							* 1.0 "& reduce to SmallFloat64 if possible"]]}
		otherwise: [self error: 'unrecognized tag pattern']