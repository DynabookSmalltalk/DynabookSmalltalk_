private
generateSandQ
	"Generate a 160-bit random seed s and an industrial grade prime q."

	| hasher s sPlusOne u q |
	hasher := SecureHashAlgorithm new.
	[
		s := self nextRandom160.
		sPlusOne := s + 1.
		sPlusOne highBit > 160 ifTrue: [sPlusOne := sPlusOne bitAnd: (1 bitShift: 160) - 1].
		u := (hasher hashInteger: s) bitXor: (hasher hashInteger: sPlusOne).
		q := u bitOr: ((1 bitShift: 159) bitOr: 1).
		(self isProbablyPrime: q) ifTrue: [^ Array with: s with: q]] repeat