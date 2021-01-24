special literal encodings
isSpecialLiteralForPush: literal
	^literal isInteger
		ifFalse:
			[literal isCharacter
				ifFalse:
					[false == literal
					 or: [true == literal
					 or: [nil == literal]]]
				ifTrue:
					[literal asInteger between: 0 and: 65535]]
	 	ifTrue:
			[literal between: -32768 and: 32767]