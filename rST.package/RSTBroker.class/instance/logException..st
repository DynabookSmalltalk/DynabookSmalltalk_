logging
logException: aException 
	"logs an Exception as an Error"
	self
		logError: [aException asString , ', description:' , aException description asString]