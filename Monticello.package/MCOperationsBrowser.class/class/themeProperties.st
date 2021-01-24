preferences
themeProperties

	^ super themeProperties, {
		{ #revertedOperationAttributes. 'Colors' . 'Text attributes to use for reverted operations in MC tools.' }.
		{ #ignoredOperationAttributes. 'Colors' . 'Text attributes to use for ignored operations in MC tools.' }.
		
		"{ #rejectedOperationAttributes. 'Colors' . 'Text attributes to use for rejected operations in MC tools.' }.
		{ #acceptedOperationAttributes. 'Colors' . 'Text attributes to use for accepted operations in MC tools.' }.
		{ #conflictingOperationAttributes. 'Colors' . 'Text attributes to use for conflicting operations in MC tools.' }."
	}