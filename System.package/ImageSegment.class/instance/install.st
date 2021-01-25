read/write segment
install
	"This operation retrieves the segment if necessary from file storage, installs it in memory, and replaces (using become:) all the root stubs with the reconstructed roots of the segment."

	| allObjectsInSegment newRoots |
	state = #onFile ifTrue: [self readFromFile].
	state = #onFileWithSymbols ifTrue:
		[self readFromFileWithSymbols].
	(state = #active) | (state = #imported) ifFalse: [self errorWrongState].
	allObjectsInSegment := self loadSegmentFrom: segment outPointers: outPointers.
	newRoots := allObjectsInSegment first.
	self checkAndReportLoadError.
	(state = #imported "just came in from exported file" or: [arrayOfRoots isNil "testing..."])
		ifTrue: [arrayOfRoots := newRoots]
		ifFalse: [arrayOfRoots elementsForwardIdentityTo: newRoots].
	state := #inactive.
	Beeper beepPrimitive