nonhomogeneous accessing
nextWord
	"Answer the next two bytes from the receiver as an Integer."

	| high low |
	high := self next ifNil: [ ^false ].
	low := self next ifNil: [ ^false ].
	^(high asInteger bitShift: 8) + low asInteger