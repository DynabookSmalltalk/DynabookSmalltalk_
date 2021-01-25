fileIn/Out
copySmartRootsExport: rootArray
	"Use SmartRefStream to find the object.  Make them all roots.  Create the segment in memory.  Project should be in first five objects in rootArray."
	^NativeImageSegment new copySmartRootsExport: rootArray 