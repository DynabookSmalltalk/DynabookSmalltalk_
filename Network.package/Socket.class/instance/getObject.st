sending-receiving objects
getObject
	"gets a serialized object from this socket"
	| encoded object |
	encoded _ String new writeStream.
	[encoded size isZero]
		whileTrue: [encoded nextPutAll: self getData].
	[self isConnected
		and: [self dataAvailable]]
		whileTrue: [encoded nextPutAll: self getData].
	object _ ReferenceStream unStream: encoded contents.
	^ object