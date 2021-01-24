binding
bindingOf: aSymbol

	(Smalltalk bindingOf: aSymbol) ifNotNil: [ :binding | ^binding ].
	items do: [ :each |
		(each isClassDefinition and: [
			each className = aSymbol ]) ifTrue: [ ^aSymbol -> each ] ].
	^nil