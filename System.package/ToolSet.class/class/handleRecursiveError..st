debugging - handlers
handleRecursiveError: description
	"THE ACTIVE PROCESS *IS* WHERE THE RECURSION WAS DETECTED."
	
	^ self default
		ifNil: [Project current primitiveError: description]
		ifNotNil: [:ts | ts handleRecursiveError: description]