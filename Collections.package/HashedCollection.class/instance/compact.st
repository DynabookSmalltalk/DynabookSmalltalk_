private
compact
	"Reduce the size of array so that the load factor will be ~75%."
	
	| newCapacity |
	newCapacity := self class sizeFor: self slowSize.
	self growTo: newCapacity