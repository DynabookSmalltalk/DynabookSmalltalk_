file streaming
writeStreamForFileNamed: aString replace: aBoolean do: aBlock
	"Can't write into the SM cache, so..."
	^MCCacheRepository default writeStreamForFileNamed: aString replace: aBoolean do: aBlock