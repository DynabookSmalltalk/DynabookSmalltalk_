menu messages
selectedClassVariable
	"Try to make a class-variable binding out of the current text selection."

	(model respondsTo: #selectedClassOrMetaClass) ifFalse: [ ^ nil ].
		
	^ self selectedSymbol ifNotNil:
		[ :symbol | model selectedClassOrMetaClass ifNotNil:
			[ :classOrMetaClass | (classOrMetaClass theNonMetaClass allClassVarNames includes: symbol)
				ifTrue: [ classOrMetaClass bindingOf: symbol ]
				ifFalse: [ nil ] ] ]