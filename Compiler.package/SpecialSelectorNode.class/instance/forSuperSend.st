code generation
forSuperSend
	"Answer the receiver or a derivative, suitable for use in a super send."

	"Excuse the code negation nonsense.  It is a vestige of a very concise but now
	 obsolete back-end bytecode encoding scheme. We're working on removing it."
	^SelectorNode new
		key: key
		code: SendType negated
		index: index