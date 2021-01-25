logging
logError: aBlock 
	"logs an error message"
	self
		logMessage: ['** ERROR: ' , aBlock value asString]