drawing
drawOverlayOn: aCanvas
	"Draw my border OVER my submorphs because the scrollbars overlap."
	
	self wantsRoundedCorners
		ifTrue: [aCanvas frameRoundRect: self bounds radius: self cornerRadius borderStyle: self borderStyle]
		ifFalse: [aCanvas frameRectangle: self bounds borderStyle: self borderStyle].
		
	super drawOverlayOn: aCanvas.