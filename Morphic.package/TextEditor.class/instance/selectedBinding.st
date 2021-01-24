menu messages
selectedBinding
	"Try to make a binding out of the current text selection. That binding can be a global or class."

	^ self selectedSymbol ifNotNil:
		[ :symbol |
			((model respondsTo: #selectedClassOrMetaClass)
				ifTrue: [ model selectedClassOrMetaClass ifNil: [ model environment ] ]
				ifFalse: [ model environment ]) ifNotNil:
					[ :environment | environment bindingOf: symbol ] ]