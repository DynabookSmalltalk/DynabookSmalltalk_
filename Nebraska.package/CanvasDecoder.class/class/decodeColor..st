decoding
decodeColor: string
	| rgb a rgb1 rgb2 |
	rgb1 := string getInteger32: 1.
	rgb2 := string getInteger32: 5.
	a := string getInteger32: 9.
	rgb := rgb2 << 16 + rgb1.

	a < 255
		ifTrue: [ ^TranslucentColor basicNew setRgb: rgb  alpha: a/255.0 ]
		ifFalse: [ ^Color basicNew setRGB: rgb ]