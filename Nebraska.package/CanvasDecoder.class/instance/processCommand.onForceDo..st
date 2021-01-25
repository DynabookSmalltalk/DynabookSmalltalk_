decoding
processCommand: command  onForceDo: forceBlock
	"Decode the given string command and perform the required action.
	If the command is a forceToScreen command, also pass the forceBlock.
	The previous chained equality tests and conditionals have been replaced by a lookup table in my class variable DecodeTable, which is set in the class-side initialize method."
	| verb verbCode selector |
	command isEmpty ifTrue: [ ^self ].

	verb := command first.
	verbCode := verb first.

	selector := DecodeTable
		at: (verbCode asciiValue + 1)
		ifAbsent: [ self error: 'unknown command: ', verb ].

	"note: codeForce is the only odd one"
	^(selector == #forceToScreen:)
		ifTrue: [ self forceToScreen: command withBlock: forceBlock ]
		ifFalse: [ self perform: selector withArguments: { command } ]
