browse
allMethodsWithString: aString matchCase: caseSensitive
	"Answer a set of MdethodReferences for all methods that contain string literals with aString as a substring.
	 Make the search case-sensitive or insensitive as dictated by the caseSensitive boolean parameter."

	^self allMethodsSelect:
		[ :method | | selector messages |
		method hasLiteralSuchThat:
			[ :literal |
			 literal isString
			 and: [ (literal includesSubstring: aString caseSensitive: caseSensitive)
			 and: [ literal isSymbol
					ifFalse: [ true ]
					ifTrue:
						[((selector ifNil: [ selector := method selector ]) == literal 
						  or: [ (messages ifNil: [ messages := method messages ]) includes: literal ]) not ] ] ] ] ]