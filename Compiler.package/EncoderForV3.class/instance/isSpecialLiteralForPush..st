special literal encodings
isSpecialLiteralForPush: literal
	^literal isInteger
		ifFalse:
			[false == literal
			 or: [true == literal
			 or: [nil == literal]]]
		ifTrue: [literal between: -1 and: 2]