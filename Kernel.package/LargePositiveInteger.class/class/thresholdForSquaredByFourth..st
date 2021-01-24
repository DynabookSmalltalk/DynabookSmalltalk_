accessing
thresholdForSquaredByFourth: anIntegerOrNil
	"the number of byte-digit above which 4-way Toom-Cook squaring is more efficient than Karatsuba"
	^ThresholdForSquaredByFourth := anIntegerOrNil ifNotNil: [:t | t max: Smalltalk wordSize]