debugging - handlers
handleError: anError
	"No exception handler caught the given error. Let the user handle that error through an interactive tool such as a debugger.
	
	THE ACTIVE PROCESS *IS* WHERE THE ERROR HAPPENED."

	^ self default
		ifNil: [ | ctx |
			Smalltalk 
				logSqueakError: anError description 
				inContext: (ctx := anError signalerContext) .
			self inform: (anError description, String cr, ctx shortStack).
			anError return "Maybe better teminate process?"]
		ifNotNil: [:ts | ts handleError: anError]