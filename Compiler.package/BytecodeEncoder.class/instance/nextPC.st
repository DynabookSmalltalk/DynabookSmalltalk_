accessing
nextPC
	"Answer the pc to store in a node for source range identification when the node is associated with its following pc."
	^blockMethod
		ifNil: [stream position + 1]
		ifNotNil: [:proxy| proxy -> (stream position + 1)]