code generation
nodeToInitialize: encoder
	^AssignmentNode new
		variable: self
		value: (NewArrayNode new numElements: remoteTemps size)