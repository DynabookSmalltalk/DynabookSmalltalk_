accessing
thresholdForDiv21: anIntegerOrNil
	"the number of byte-digit above which schoolbook division is more efficient than recursive division"
	ThresholdForDiv21 := anIntegerOrNil ifNotNil: [:t | t max: Smalltalk wordSize]