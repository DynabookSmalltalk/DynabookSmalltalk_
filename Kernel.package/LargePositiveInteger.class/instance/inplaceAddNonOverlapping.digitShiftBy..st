private
inplaceAddNonOverlapping: anInteger digitShiftBy: p
	"Beware: this will destructively replace some digits with that of anInteger.
	- if self and anInteger are of same sign
		(self negative = anInteger negative).
	- if self and anInteger have no overlapping digits
		(self anyBitOfMagnitudeFrom: 8 * p + 1 to: anInteger digitLength + p * 8) not.
	- if anInteger does not overflow self digitLength
		anInteger digitLength + p <= self digitLength.
	then, and only then, this method can be used instead of more costly
		self + (anInteger bitShift: 8 * p).
	This operation is useful in divide and conquer reconstruction phase"
	
	self replaceFrom: p + 1 to: p + anInteger digitLength with: anInteger startingAt: 1