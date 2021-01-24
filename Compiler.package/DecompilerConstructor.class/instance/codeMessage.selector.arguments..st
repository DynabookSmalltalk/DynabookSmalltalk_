constructor
codeMessage: receiver selector: selector arguments: arguments
	| symbol |
	symbol := selector key.
	(self
		decodeLiteralVariableValueDereferenceWithReceiver: receiver
		selector: symbol
		arguments: arguments) ifNotNil: [:node| ^node].

	^MessageNode new
			receiver: receiver selector: selector
			arguments: arguments
			precedence: symbol precedence