accessing
thresholdForSquaredByHalf: anIntegerOrNil
	"the number of byte-digit above which Karatsuba squaring is more efficient than schoolbook multiplication"
	^ThresholdForSquaredByHalf := anIntegerOrNil ifNotNil: [:t | t max: Smalltalk wordSize]