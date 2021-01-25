private
outPointerIndexForClassIndex: classIndex
	"If the top bit of a classIndex is set it is that of a class imported from outPointers"
	^classIndex - 16r1FFFFF "a.k.a. classIndex - 16r200000 + 1"