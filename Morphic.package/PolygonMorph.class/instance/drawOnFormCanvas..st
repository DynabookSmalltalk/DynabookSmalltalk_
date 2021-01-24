drawing
drawOnFormCanvas: aCanvas 
	"Display the receiver, a spline curve, approximated by straight line segments."

	| |
	vertices size < 1 ifTrue: [self error: 'a polygon must have at least one point'].
	closed & color isTransparent not
		ifTrue: [aCanvas stencil: self filledForm at: self bounds topLeft - 1 color: self color].
	(self borderColor isColor and: [self borderColor isTranslucentColor])
		ifTrue: [aCanvas stencil: self borderForm at: self bounds topLeft
						color: self borderColor]
		ifFalse: [self drawBorderOn: aCanvas].
	self arrowForms do:
		[:f | aCanvas stencil: f at: f offset
			color: (self borderColor isColor ifTrue: [self borderColor] ifFalse: [self color])]