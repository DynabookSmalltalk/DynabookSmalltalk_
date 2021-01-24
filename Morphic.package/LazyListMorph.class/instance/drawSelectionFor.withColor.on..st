drawing
drawSelectionFor: index withColor: color on: aCanvas
	
	| selectionDrawBounds fill |
	index ifNil: [ ^self ].
	index = 0 ifTrue: [ ^self ].
	selectionDrawBounds := self drawBoundsForRow: index.
	selectionDrawBounds := selectionDrawBounds intersect: self bounds.
	
	fill := color isColor
		ifTrue: [SolidFillStyle color: color]
		ifFalse: [color].
	fill isGradientFill ifTrue: [
		fill origin: selectionDrawBounds topLeft.
		fill direction: 0@ selectionDrawBounds height].
	
	listSource hasMultiSelection
		ifFalse: [aCanvas fillRectangle: selectionDrawBounds fillStyle: fill]
		ifTrue: [aCanvas frameRectangle: selectionDrawBounds color: fill asColor] .