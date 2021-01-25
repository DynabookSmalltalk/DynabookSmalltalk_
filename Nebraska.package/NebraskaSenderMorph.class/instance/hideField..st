as yet unclassified
hideField: aFieldName
	fields at: aFieldName ifPresent: [:m |
		[m owner notNil and: [m owner submorphs size =1]]
			whileTrue: [m := m owner].
		m delete]