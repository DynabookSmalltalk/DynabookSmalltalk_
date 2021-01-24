mathematical functions
floorLog: radix
	"Unlike super, this version is exact when radix is integer"
	
	radix isInteger ifFalse: [^super floorLog: radix].
	self <= 0 ifTrue: [^DomainError signal: 'floorLog: is only defined for x > 0.0'].
	^(self numberOfDigitsInBase: radix) - 1