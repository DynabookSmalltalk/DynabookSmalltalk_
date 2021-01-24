accessing
pc
	"Answer the pc to store in a node for source range identification."
	^blockMethod
		ifNil: [stream position]
		ifNotNil: [:aCompiledBlock| aCompiledBlock -> stream position]