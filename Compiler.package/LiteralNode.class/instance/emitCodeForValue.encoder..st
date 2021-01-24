code generation
emitCodeForValue: stack encoder: encoder
	stack push: 1.
	(encoder isSpecialLiteralForPush: key)
		ifTrue: [encoder genPushSpecialLiteral: key]
		ifFalse: [encoder genPushLiteral: index]