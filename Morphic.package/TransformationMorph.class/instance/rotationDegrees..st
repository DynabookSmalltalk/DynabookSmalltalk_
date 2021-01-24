rotate scale and flex
rotationDegrees: degrees
	"Overwritten because we know how to rotate our submorphs."
	
	self adjustAfter:[self angle: degrees degreesToRadians negated]