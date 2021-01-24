instruction decoding
pushFullClosure: aCompiledBlock numCopied: numCopied
	"Simulate the action of a 'closure copy' bytecode whose result is the
	 new FullBlockClosure for the supplied compiled block."
	| copiedValues |
	numCopied > 0
		ifTrue:
			[copiedValues := Array new: numCopied.
			 numCopied to: 1 by: -1 do:
				[:i|
				copiedValues at: i put: self pop]]
		ifFalse:
			[copiedValues := nil].
	self push: ((FullBlockClosure new: numCopied)
				receiver: receiver
				outerContext: self
				method: aCompiledBlock
				copiedValues: copiedValues)