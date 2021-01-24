accessing
thresholdForMul33: anIntegerOrNil
	"the number of byte-digit above which 3-way Toom-Cook is more efficient than Karatsuba"
	ThresholdForMul33 := anIntegerOrNil ifNotNil: [:t | t max: Smalltalk wordSize + 1]