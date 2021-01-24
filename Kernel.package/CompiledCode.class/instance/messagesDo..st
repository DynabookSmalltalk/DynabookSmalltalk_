scanning
messagesDo: workBlock
	"Evaluate aBlock with all the message selectors sent by me. Duplicate seletors are possible."

	"If anything should be deprecated it is messagesDo:; it can be an extension in AST/Refactoring.
	 This method enumerates over selectors, not messages.  c.f. Behavior>>selectorsDo: etc"
	^self selectorsDo: workBlock