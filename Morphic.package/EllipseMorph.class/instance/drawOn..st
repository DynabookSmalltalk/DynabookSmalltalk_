drawing
drawOn: aCanvas 

	aCanvas isShadowDrawing
		ifTrue: [^ aCanvas fillOval: self bounds fillStyle: self fillStyle borderWidth: 0 borderColor: nil].
	aCanvas fillOval: self bounds fillStyle: self fillStyle borderWidth: self borderWidth borderColor: self borderColor.
