drawing-rectangles
frameAndFillRectangle: r fillColor: fillColor borderWidth: borderWidth topLeftColor: topLeftColor bottomRightColor: bottomRightColor

	| w h rect |
	"First use quick code for top and left borders and fill"
	self frameAndFillRectangle: r
		fillColor: fillColor
		borderWidth: borderWidth
		borderColor: topLeftColor.
	
	"Return here for duplicate colors. Makes translucent borders work better."
	topLeftColor = bottomRightColor ifTrue: [^ self].

	"Now use slow code for bevelled bottom and right borders"
	bottomRightColor isTransparent ifFalse: [
		borderWidth isNumber
			ifTrue: [w := h := borderWidth]
			ifFalse: [w := borderWidth x.   h := borderWidth y].
		rect := r translateBy: origin.
		self setFillColor: bottomRightColor.
		port 
			 frameRectRight: rect width: w;
			 frameRectBottom: rect height: h].
