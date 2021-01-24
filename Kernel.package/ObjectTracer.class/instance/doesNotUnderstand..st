very few messages
doesNotUnderstand: aMessage 
	"Present a debugger before proceeding to re-send the message"

	"All external messages (those not caused by the re-send) get trapped here"
	Processor activeProcess
		debugWithTitle: 'Object Tracer (', self identityHash, ')'
		full: false
		contents: ('On an instance of\	{1} ({2})\\About to perform\	{3}\\Using the following arguments\	{4}' translated withCRs
			format: {
				thisContext objectClass: tracedObject.
				tracedObject identityHash.
				aMessage selector storeString.
				aMessage arguments printString}).
		
	^ aMessage sendTo: tracedObject