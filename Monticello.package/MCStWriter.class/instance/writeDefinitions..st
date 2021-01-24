writing
writeDefinitions: aCollection
	"initStream is an ugly hack until we have proper init defs"
	initStream := String new writeStream.

	(MCDependencySorter sortItems: aCollection)
		do: [:ea | ea accept: self]
		displayingProgress: 'Writing definitions...'.
	
	stream nextPutAll: initStream contents.