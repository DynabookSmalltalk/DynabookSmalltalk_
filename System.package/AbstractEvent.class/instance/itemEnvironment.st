accessing - specific
itemEnvironment
	
	^ self
		environmentAt: self class environmentKind
		ifAbsent: [Smalltalk globals]