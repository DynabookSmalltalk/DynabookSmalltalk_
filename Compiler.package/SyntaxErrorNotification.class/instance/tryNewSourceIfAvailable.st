accessing
tryNewSourceIfAvailable
	newSource ifNotNil: [ReparseAfterSourceEditing withNewSource: newSource]