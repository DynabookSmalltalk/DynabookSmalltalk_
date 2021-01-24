accessing
raisedColor

	^ self containingWindow
		ifNil: [super raisedColor]
		ifNotNil: [:window | window raisedColor]