private-exceptions
cannotReturn: result

	closureOrNil notNil ifTrue:
		[^self cannotReturn: result to: self home sender].
	Processor activeProcess
		debug: thisContext
		title: 'computation has been terminated'
		full: false.