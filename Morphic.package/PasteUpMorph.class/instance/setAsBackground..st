visual properties
setAsBackground: aFormOrColorOrFillStyle

	| project |
	(self outermostWorldMorph == self and: [(project := self project) isMorphic])
		ifTrue: [project setAsBackground: aFormOrColorOrFillStyle]
		ifFalse: [self fillStyle: aFormOrColorOrFillStyle].