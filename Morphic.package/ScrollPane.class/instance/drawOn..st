drawing
drawOn: aCanvas

	self wantsRoundedCorners
		ifTrue: [aCanvas fillRoundRect: self bounds radius: self cornerRadius fillStyle: self fillStyle]
		ifFalse: [aCanvas fillRectangle: self bounds fillStyle: self fillStyle].