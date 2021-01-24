operations
newVersion
	| packageSnapshot parentSnapshot patch patchBlock |
	parentSnapshot := self parentSnapshot.
	patchBlock :=  [patch := (packageSnapshot := package snapshot) patchRelativeToBase: parentSnapshot].
	patchBlock value. "Ensure that this is called at least once."
	^ (self requestVersionNameAndMessageWithSuggestion: self uniqueVersionName
		initialMessage: self patchMessageSuggestion
		patchBlock: patchBlock
	) ifNotNil: [:tuple |
		self newVersionWithName: tuple first withBlanksTrimmed
			message: (self patchMessageStripped: tuple second)
			snapshot: ((tuple size >= 3 and: [tuple third notNil and: [tuple third notEmpty]])
				ifTrue: [	MCPatcher apply: (patch ignoring: tuple third) to: parentSnapshot]
				ifFalse: [packageSnapshot])]