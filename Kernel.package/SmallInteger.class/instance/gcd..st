arithmetic
gcd: anInteger 
	"See SmallInteger (Integer) | gcd:"
	| n m |
	anInteger denominator = 1 ifFalse: [^anInteger gcd: self].
	n := self.
	m := anInteger.
	[n = 0]
		whileFalse: 
			[n := m \\ (m := n)].
	^ m abs