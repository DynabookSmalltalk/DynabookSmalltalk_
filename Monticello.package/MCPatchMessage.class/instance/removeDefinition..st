patch operations
removeDefinition: aDefinition
	stream nextPutAll: 'D'; tab; nextPutAll: aDefinition summary; cr