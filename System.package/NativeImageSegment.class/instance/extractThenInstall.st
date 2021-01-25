read/write segment
extractThenInstall
	"For testing only"

	| allObjectsInSegment newRoots |
	state = #activeCopy ifFalse: [self errorWrongState].
	arrayOfRoots elementsForwardIdentityTo:
		(arrayOfRoots collect: [:r | r rootStubInImageSegment: self]).
	state := #active.
	allObjectsInSegment := self loadSegmentFrom: segment outPointers: outPointers.
	newRoots := allObjectsInSegment first.
	state := #inactive.
	arrayOfRoots elementsForwardIdentityTo: newRoots.