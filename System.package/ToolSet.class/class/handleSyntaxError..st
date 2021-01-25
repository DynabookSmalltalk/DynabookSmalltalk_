debugging - handlers
handleSyntaxError: anError
	"A syntax error (notification) occurred while parsing and compiling source code. Usually, the compiling process suspends until the syntax error gets corrected.
	
	THE ACTIVE PROCESS *IS* THAT COMPILER PROCESS."

	^ self default
		ifNil: [self handleError: anError]
		ifNotNil: [:ts | ts handleSyntaxError: anError]