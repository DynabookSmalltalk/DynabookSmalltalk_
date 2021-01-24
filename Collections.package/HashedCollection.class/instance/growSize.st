private
growSize
	"Answer what my next higher table size should be"
	
	^self class sizeFor: self slowSize * 2