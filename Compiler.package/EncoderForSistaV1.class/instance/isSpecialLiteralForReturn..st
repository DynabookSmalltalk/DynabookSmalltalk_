special literal encodings
isSpecialLiteralForReturn: literal
	^literal == false
	  or: [literal == true
	  or: [literal == nil]]