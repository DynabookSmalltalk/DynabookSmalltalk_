scanning
scanBlockOrNilForLiteral: aLiteral
	"Answer a block argument for CompiledMethod>>#scanFor: that answers
	 if the method refers to the literal implicitly via a special bytecode.
	 If the literal is not accessible via a special bytecode, answer nil."
	| value |
	"176-191 	1011iiii 	Send Arithmetic Message #iiii
	 192-207 	1100iiii 	Send Special Message #iiii"
	(aLiteral isSymbol or: [aLiteral isInteger]) ifTrue:
		[value := aLiteral isSymbol
					ifTrue: [176 + ((Smalltalk specialSelectors indexOf: aLiteral ifAbsent: [^nil]) // 2)]
					ifFalse: [(aLiteral between: -1 and: 2) ifFalse: [^nil].
							aLiteral + 117].
		 ^[:byte| byte = value]].
	"112-119 	01110iii 	Push (receiver, true, false, nil, -1, 0, 1, 2) [iii]
	 120-123 	011110ii 	Return (receiver, true, false, nil) [ii] From Message"
	aLiteral == true ifTrue:
		[^[:byte| byte = 113 or: [byte = 121]]].
	aLiteral == false ifTrue:
		[^[:byte| byte = 114 or: [byte = 122]]].
	aLiteral == nil ifTrue:
		[^[:byte| byte = 115 or: [byte = 123]]].
	^nil