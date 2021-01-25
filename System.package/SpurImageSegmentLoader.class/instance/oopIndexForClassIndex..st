private
oopIndexForClassIndex: classIndex
	"When a classIndex doesn't have the topBit set it maps to an oop in the segment thusly:"
	^classIndex - 16 "self firstClassIndexPun" * 8 "self allocationUnit"