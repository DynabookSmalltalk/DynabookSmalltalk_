converting
commentFor: aPseudoClass
	| comment |
	comment := aPseudoClass organization classComment.
	^ comment asString = ''
		ifTrue: [comment]
		ifFalse: [comment string]