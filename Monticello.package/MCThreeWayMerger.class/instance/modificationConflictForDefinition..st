as yet unclassified
modificationConflictForDefinition: aDefinition
	^ conflicts ifNotNil:
		[conflicts detect:
			[:ea | (ea definition isRevisionOf: aDefinition) and:
				[ea operation isModification]] ifNone: []]