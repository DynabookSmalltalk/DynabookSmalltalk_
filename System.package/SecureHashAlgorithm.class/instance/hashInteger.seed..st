public
hashInteger: aPositiveInteger seed: seedInteger
	"Hash the given positive integer. The integer to be hashed should have 512 or fewer bits. This entry point is used in the production of random numbers"

	| buffer dstIndex |
	"Initialize totalA through totalE to their seed values."
	totals
		ifNil: [
			totalA := ThirtyTwoBitRegister
				fromInteger: ((seedInteger bitShift: -128) bitAnd: 16rFFFFFFFF).
			totalB := ThirtyTwoBitRegister
				fromInteger: ((seedInteger bitShift: -96) bitAnd: 16rFFFFFFFF).
			totalC := ThirtyTwoBitRegister
				fromInteger: ((seedInteger bitShift: -64) bitAnd: 16rFFFFFFFF).
			totalD := ThirtyTwoBitRegister
				fromInteger: ((seedInteger bitShift: -32) bitAnd: 16rFFFFFFFF).
			totalE := ThirtyTwoBitRegister
				fromInteger: (seedInteger bitAnd: 16rFFFFFFFF) ]
		ifNotNil: [
			totals
				at: 1 put: ((seedInteger bitShift: -128) bitAnd: 16rFFFFFFFF);
				at: 2 put: ((seedInteger bitShift: -96) bitAnd: 16rFFFFFFFF);
				at: 3 put: ((seedInteger bitShift: -64) bitAnd: 16rFFFFFFFF);
				at: 4 put: ((seedInteger bitShift: -32) bitAnd: 16rFFFFFFFF);
				at: 5 put: (seedInteger bitAnd: 16rFFFFFFFF) ].
	"pad integer with zeros"
	buffer := ByteArray new: 64.
	dstIndex := 0.
	aPositiveInteger digitLength to: 1 by: -1 do: [:i |
		buffer at: (dstIndex := dstIndex + 1) put: (aPositiveInteger digitAt: i)].

	"process that one block"
	self processBuffer: buffer.

	^ self finalHash
