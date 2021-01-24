instance creation
new
	"Create a HashedCollection large enough to hold 3 different objects without growing."

	^self basicNew initialize: 5 "For performance, inline the value 5 which would normally be returned by #sizeFor:."