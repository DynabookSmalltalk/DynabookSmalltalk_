drawing-images
stencil: stencilForm at: aPoint sourceRect: sourceRect color: aColor
	"Flood this canvas with aColor wherever stencilForm has non-zero pixels"
	self drawCommand: [ :executor |
		executor stencil: stencilForm at: aPoint sourceRect: sourceRect color: aColor ]