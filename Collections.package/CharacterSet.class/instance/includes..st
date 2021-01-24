testing
includes: anObject 
	anObject isCharacter ifFalse: [ ^false ].
	^self includesCode: anObject asInteger