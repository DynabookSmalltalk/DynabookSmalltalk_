code generation
emitCodeForValue: stack encoder: encoder
	stack push: 1.
	encoder
		if: code
		isSpecialLiteralForPush:
			[:specialLiteral|
			 ^encoder genPushSpecialLiteral: specialLiteral].
	(code = LdSelf or: [code = LdSuper]) ifTrue:
		[^encoder genPushReceiver].
	code = LdThisContext ifTrue:
		[^encoder genPushThisContext].
	self error: 'internal compiler error; should not happen'