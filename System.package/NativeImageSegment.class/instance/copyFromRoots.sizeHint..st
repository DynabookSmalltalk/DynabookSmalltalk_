read/write segment
copyFromRoots: aRootArray sizeHint: segSizeHint
	"Copy a tree of objects into a WordArray segment.  The copied objects in the segment are not in the normal Squeak space.  If this method yields a very small segment, it is because objects just below the roots are pointed at from the outside.  (See findRogueRootsImSeg: for a *destructive* diagnostic of who is pointing in.)
	Caller must hold onto Symbols.
	To go faster, make sure objects are not repeated in aRootArray and other method directly, with true."

	self copyFromRoots: aRootArray sizeHint: segSizeHint areUnique: false