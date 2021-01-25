fileIn/Out
copyFromRootsForExport: rootArray
	"When possible, use copySmartRootsExport:. This way may not copy a complete tree
	 of objects. Add to roots: all of the methods pointed to from the outside by blocks."
	^NativeImageSegment new copyFromRootsForExport: rootArray