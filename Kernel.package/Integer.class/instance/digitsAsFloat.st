private
digitsAsFloat
	"private - naive conversion method.
	This method should be used if and only if
	Float precision + 8 >= self highBit.
	This way, all floating point operations will be exact, but eventually the
	last one, giving a guaranty that result will be the nearest Float."
	| result n |
	result := (self digitAt: (n := self digitLength)) asFloat.
	[(n := n - 1) > 0]
		whileTrue: [result := 256.0 * result + (self digitAt: n) asFloat].
	^ result