decoding
decodePoint: string
	| x y |
	x := string getInteger32: 1.
	y := string getInteger32: 5.

	^x@y