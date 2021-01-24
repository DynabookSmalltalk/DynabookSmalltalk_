accessing
ignoring: ignoredOperations
	^ MCPatch operations: (operations difference: ignoredOperations)