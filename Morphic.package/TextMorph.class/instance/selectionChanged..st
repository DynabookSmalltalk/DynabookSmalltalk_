private
selectionChanged: rects
	"Invalidate all the selection rectangles. By using either fullBounds or outerBounds, we make sure that any drop shadow is accounted for too."
	
	| myBounds |
	rects ifEmpty: [^ self].
	myBounds := fullBounds ifNil: [self outerBounds].
	rects do: [:r | self invalidRect: (r intersect: myBounds)].