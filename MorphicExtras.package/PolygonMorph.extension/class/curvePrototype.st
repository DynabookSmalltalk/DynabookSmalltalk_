*MorphicExtras--instance creation
curvePrototype
	"Answer an instance of the receiver that will serve as a prototypical curve"

	| aa |
	aa := self new. 
	aa vertices: (Array with: 0@80 with: 70@90 with: 60@0) 
		color: Color orange lighter 
		borderWidth: 4 
		borderColor: Color black.
	aa beSmoothCurve.
	aa setNameTo: 'Curve'.
	aa makeForwardArrow.		"is already open"
	aa computeBounds.
	^ aa

"
PolygonMorph curvePrototype openInHand
"