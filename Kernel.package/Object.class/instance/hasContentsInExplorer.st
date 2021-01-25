user interface
hasContentsInExplorer

	^self basicSize > 0 or: [self class allInstVarNames isEmpty not]
