piano rolls
pauseProgrammedMoves

	programmedMoves isEmptyOrNil ifTrue: [^self].
	programmedMoves first
		at: #pauseTime
		put: Time millisecondClockValue
