accessing
insetColor

	^ self containingWindow
		ifNil: [super insetColor]
		ifNotNil: [:window | window colorForInsets]