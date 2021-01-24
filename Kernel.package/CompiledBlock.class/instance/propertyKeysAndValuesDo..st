accessing-pragmas & properties
propertyKeysAndValuesDo: aBlock
	"Enumerate the receiver with all the keys and values."
	^self homeMethod propertyKeysAndValuesDo: aBlock