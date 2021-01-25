fileIn/Out
copyFromRootsLocalFileFor: rootArray sizeHint: segSize
	"If the roots include a World, add its Player classes to the roots."
	^NativeImageSegment new copyFromRootsLocalFileFor: rootArray sizeHint: segSize