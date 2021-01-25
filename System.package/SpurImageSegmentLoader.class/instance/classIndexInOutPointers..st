private
classIndexInOutPointers: classIndex
	"If the top bit of a classIndex is set it is that of a class imported from outPointers"
	^classIndex anyMask: 16r200000