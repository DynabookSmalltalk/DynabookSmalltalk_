patch operations
modifyDefinition: oldDefinition to: newDefinition
	stream nextPutAll: 'M'; tab; nextPutAll: newDefinition summary; cr