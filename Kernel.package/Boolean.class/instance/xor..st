logical operations
xor: aBoolean 
	"Exclusive OR. Answer true if the receiver is not equivalent to aBoolean."

	^(self == aBoolean) not