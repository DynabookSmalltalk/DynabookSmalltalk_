mathematical functions
sqrt
	"Answer the square root of the receiver.
	If the square root is exact, answer an Integer, else answer a Float approximation"
	| floatResult integerResult |
	self negative ifTrue: [
		^ DomainError signal: 'sqrt undefined for number less than zero.' ].
	floatResult := self asFloat sqrt.
	integerResult := floatResult truncated.
	"Note: truncated works for 60-bit SmallInteger
	If self is a square s^2, but asFloat rounds down,
	f = s^2*(1-e), f^0.5 = s*(1-e)^0.5 = s*(1-0.5*e+O(e^2))
	since s asFloat is exact, and e <= 0.5*ulp(1),
	s*(1-0.5*e+O(e^2)) always rounds to s"
	integerResult * integerResult = self ifTrue: [^integerResult].
	^floatResult