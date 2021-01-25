I/O
nextPut: aStringArray

	inArrays ifNil: [^aStringArray].

	^outArrays add: aStringArray.
	"WRITESTRINGSIZES ifNil: [WRITESTRINGSIZES := Bag new].
	aStringArray do: [ :each | WRITESTRINGSIZES add: each size]."