layout
cellInset: inset
	"Always store a rectangle to speed up drawing."
	
	super cellInset: (inset isRectangle
						ifTrue: [inset]
						ifFalse: [inset asPoint corner: inset asPoint]).