printing
kindOfSubclass
	type = #normal ifTrue: [^' subclass: '].
	type = #variable ifTrue: [^' variableSubclass: '].
	type = #bytes ifTrue: [^' variableByteSubclass: '].
	type = #compiledMethod ifTrue: [^' variableByteSubclass: ' ].
	type = #shorts ifTrue: [^' variableDoubleByteSubclass: '].
	type = #words ifTrue: [^' variableWordSubclass: '].
	type = #longs ifTrue: [^' variableDoubleWordSubclass: '].
	type = #weak ifTrue: [^' weakSubclass: ' ].
	type = #ephemeron ifTrue: [^' ephemeronSubclass: ' ].
	type = #immediate ifTrue: [^' immediateSubclass: ' ].
	self error: 'Unrecognized class type'
