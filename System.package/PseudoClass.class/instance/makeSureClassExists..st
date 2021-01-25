private
makeSureClassExists: aString
	| theClass |
	theClass := Smalltalk at: (aString asSymbol) ifAbsent:[nil].
	theClass ifNotNil:[^true].
	^self confirm: aString,' does not exist in the system. Use nil instead?'.