printing
printOn: aStream

	super printOn: aStream.
	
	aStream nextPutAll: '( '.
	
	{ {'l'. self leftFraction. self leftOffset}. {'t'. self topFraction. self topOffset}. {'r'. self rightFraction. self rightOffset}. {'b'. self bottomFraction. self bottomOffset} } do: [:spec |
		aStream nextPutAll: spec first; space.
		
		(spec second ifNil: [0]) printOn: aStream maxDecimalPlaces: 2.
		
		aStream nextPutAll: ((spec third ifNil: [0]) >= 0 ifTrue: ['+'] ifFalse: ['-']).
		(spec third ifNil: [0]) abs printOn: aStream maxDecimalPlaces: 0]
			separatedBy: [aStream space].
			
	aStream nextPutAll: ' )'.