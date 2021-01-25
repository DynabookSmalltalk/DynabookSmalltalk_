debugging - handlers
handleWarning: aWarning
	"No exception handler caught the given warning. Let the user handle that warning through an interactive tool such as a debugger.
	
	THE ACTIVE PROCESS *IS* WHERE THE WARNING HAPPENED."

	^ self default
		ifNil: [
			self inform: (aWarning messageText, String cr, aWarning signalerContext shortStack).
			aWarning resume]
		ifNotNil: [:ts | ts handleWarning: aWarning]