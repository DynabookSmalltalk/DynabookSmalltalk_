testing
includesCode: anInteger
	anInteger > 255 ifTrue: [ ^false ].
	^(byteArrayMap at: anInteger + 1) > 0