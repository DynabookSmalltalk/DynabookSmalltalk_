drawing
drawOn: aCanvas
	"Draw thumbnail for my page, if it is available. Otherwise, just draw a rectangle." 

	| thumbnail oldExt |
	self color == Color transparent 
	ifTrue: ["show thumbnail"
		thumbnail := self thumbnailOrNil.
		thumbnail
			ifNil: [aCanvas frameRectangle: self bounds width: self borderWidth 
						color: self borderColor.
				aCanvas fillRectangle: (self bounds insetBy: self borderWidth) color: self color]
			ifNotNil: [oldExt := self bounds extent.
				bounds := self bounds origin extent: thumbnail extent + (2@2).
				aCanvas frameRectangle: self bounds width: self borderWidth color: self borderColor.
				aCanvas paintImage: thumbnail at: self bounds origin + self borderWidth.
				oldExt = thumbnail extent ifFalse: [self layoutChanged]]]
	ifFalse: ["show labeled button"
		^ super drawOn: aCanvas]
