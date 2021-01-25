private
arraysFromAssociate: arrays
	"new string-arrays have arrived from our associate"

	inArrays ifNil: [^self].
	inArrays addAll: arrays.