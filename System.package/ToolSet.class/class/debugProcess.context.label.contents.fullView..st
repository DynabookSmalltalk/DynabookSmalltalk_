debugging
debugProcess: aProcess context: aContext label: aString contents: contents fullView: aBool
	"Open a debugger on the given process, which might be active, suspended, or terminated."

	^ self default
		ifNil: [(self confirm: 'Debugger request -- proceed?') ifFalse: [Processor terminateActive]]
		ifNotNil: [:ts | ts debugProcess: aProcess context: aContext label: aString contents: contents fullView: aBool]