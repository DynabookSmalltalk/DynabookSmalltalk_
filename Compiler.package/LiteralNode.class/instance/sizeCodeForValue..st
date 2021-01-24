code generation
sizeCodeForValue: encoder
	self reserve: encoder.
	^(encoder isSpecialLiteralForPush: key)
		ifTrue: [encoder sizePushSpecialLiteral: key]
		ifFalse: [encoder sizePushLiteral: index]