writing
writeMethodInitializer: aMethodDefinition
	aMethodDefinition isInitializer ifTrue:
		[initStream nextChunkPut: aMethodDefinition className, ' initialize'; cr]