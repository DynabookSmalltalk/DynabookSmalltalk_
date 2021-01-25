decoding
decodeRectangle: string
	| x y cornerX cornerY |
	x := string getInteger32: 1.
	y := string getInteger32: 5.
	cornerX := string getInteger32: 9.
	cornerY := string getInteger32: 13.

	^x@y corner: cornerX@cornerY