class initialization
postRecompileAction
	"The ArrowImagesCache and BoxesImagesCache are LRUCaches that reference blocks
	 (including indirectly via their map which is a PluggableDictionary integerDictionary).
	 Rebuild them to ensure blocks reference freshly recompiled methods."

	self initializeImagesCache