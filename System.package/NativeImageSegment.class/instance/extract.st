read/write segment
extract
	"This operation replaces (using become:) all the original roots of a segment with segmentRootStubs.  Thus the original objects will be reclaimed, and the root stubs will remain to bring the segment back in if it is needed."

	Cursor write showWhile: [
		state = #inactive ifTrue: [self copyFromRoots: arrayOfRoots sizeHint: 0].
		state = #activeCopy ifFalse: [self errorWrongState].
		arrayOfRoots elementsForwardIdentityTo:
			(arrayOfRoots collect: [:r | r rootStubInImageSegment: self]).
		state := #active].