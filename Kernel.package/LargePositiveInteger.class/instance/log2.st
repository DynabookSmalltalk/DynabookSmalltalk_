mathematical functions
log2
	"This function is defined because super log2 might overflow."
	| res h |
	res := super log2.
	res isFinite ifTrue: [^res].
	h := self highBit.
	^h + (self / (1 << h)) asFloat log2