debugging
debugSyntaxError: aSyntaxErrorNotification
	"Opens a tool to let the user correct the syntax error, which then resumes the compiler process."
	
	^ self default
		ifNil: [Project uiManager edit: aSyntaxErrorNotification errorCode label: 'Syntax Error (read only)']
		ifNotNil: [:ts | ts debugSyntaxError: aSyntaxErrorNotification]