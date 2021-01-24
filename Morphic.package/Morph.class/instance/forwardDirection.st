rotate scale and flex
forwardDirection
	"Return the receiver's offset to distinguish #heading from #rotationDegrees."
	
	^ self valueOfProperty: #forwardDirection ifAbsent: [0.0]