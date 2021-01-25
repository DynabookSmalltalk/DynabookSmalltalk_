network
processIO
	| command didSomething |
	connection ifNil: [ ^self ].
	connection processIO.
	didSomething := false.
	[ command := connection nextOrNil.  command notNil ] whileTrue: [
		didSomething := true.
		self processCommand: command ].

	^didSomething