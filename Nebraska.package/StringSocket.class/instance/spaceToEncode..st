private-IO
spaceToEncode: anArray
	"return the number of characters needed to encode the given string array"
	^anArray inject: 4 into: [ :sum :array |
		sum + (array size + 4) ].