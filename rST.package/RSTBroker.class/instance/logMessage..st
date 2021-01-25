logging
logMessage: aBlock 
	"evaluates the block and log the result (when logging is off the block is  
	not evaluated, so the code to compose the message is not evaluated)"
	logging
		ifTrue: [RSTDialectIndependency instance logMessage: aBlock]