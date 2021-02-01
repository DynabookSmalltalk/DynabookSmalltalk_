geometry
extent: aPoint
	"Round to multiples of magnification"
	srcExtent := (aPoint - (2 * self borderWidth)) // magnification.
	^super extent: self defaultExtent