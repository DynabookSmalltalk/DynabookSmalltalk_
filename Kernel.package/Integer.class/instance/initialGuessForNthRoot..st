private
initialGuessForNthRoot: aPositiveInteger
	"Use a simplistic scheme based solely on most significant bit"
	^1 bitShift: self highBitOfMagnitude + aPositiveInteger - 1 // aPositiveInteger