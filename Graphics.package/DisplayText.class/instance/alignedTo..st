accessing
alignedTo: alignPointSelector
	"Return a copy with offset according to alignPointSelector which is one of...
	#(topLeft, topCenter, topRight, leftCenter, center, etc)"
	| boundingBox |
	boundingBox := 0@0 corner: self form extent.
	^ self shallowCopy offset: (0@0) - (boundingBox perform: alignPointSelector)