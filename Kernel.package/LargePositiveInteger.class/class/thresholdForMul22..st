accessing
thresholdForMul22: anIntegerOrNil
	"the number of byte-digit above which Karatsuba is more efficient than schoolbook"
	ThresholdForMul22 := anIntegerOrNil ifNotNil: [:t | t max: Smalltalk wordSize + 1]