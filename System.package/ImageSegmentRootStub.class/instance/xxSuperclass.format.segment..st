fetch from disk
xxSuperclass: superclass format: format segment: segment

	"Set up fields like a class but with null methodDict"
	shadowSuper := superclass.
	shadowMethodDict := nil.
	shadowFormat := format.
	imageSegment := segment.
