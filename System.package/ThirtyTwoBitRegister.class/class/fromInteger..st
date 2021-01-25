instance creation
fromInteger: aPositiveInteger
	"Answer a new instance whose initial contents is copied from aPositiveInteger.
	It is required that aPositiveInteger has no more than 32 bits."

	^ self basicNew load: aPositiveInteger
