*System-debugging
debugWithTitle: title full: bool contents: contents
	"Automatically choose the top context."

	^ self
		debug: (self isActiveProcess ifTrue: [thisContext] ifFalse: [self suspendedContext])
		title: title
		full: bool
		contents: contents