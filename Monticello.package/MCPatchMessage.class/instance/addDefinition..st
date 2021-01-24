patch operations
addDefinition: aDefinition
	stream nextPutAll: 'A'; tab; nextPutAll: aDefinition summary; cr