*MorphicExtras--instance creation
trianglePrototype
	"Answer an instance of the receiver that will serve as a prototypical triangle"

	| aa |
	aa := self new. 
	aa vertices: {0.0@0.0. 138.0@0.0. -37.0@ -74.0}
		color:  (TranslucentColor r: 0.387 g: 1.0 b: 0.548 alpha: 0.463)
		borderWidth: 3 
		borderColor: Color black.
	aa setProperty: #noNewVertices toValue: true.
	aa setNameTo: 'Triangle'.
	aa makeForwardArrow.		"is already open"
	aa computeBounds.
	aa addHandles.
	^ aa

"
PolygonMorph trianglePrototype openInHand
"