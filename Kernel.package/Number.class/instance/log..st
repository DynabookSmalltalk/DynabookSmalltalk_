mathematical functions
log: aNumber 
	"Answer the log base aNumber of the receiver."

	aNumber = 2 ifTrue: [^self log2].
	aNumber isPowerOfTwo ifTrue: [^self log2 / aNumber log2].
	^self ln / aNumber ln