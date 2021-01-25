read/write segment
copyFromRootsForExport: rootArray 
	"When possible, use copySmartRootsExport:.  This way may not copy a complete tree of objects.  Add to roots: all of the methods pointed to from the outside by blocks."
	| newRoots segSize symbolHolder |
	arrayOfRoots := rootArray.
	"self halt."
	symbolHolder := Symbol allSymbols.	"Hold onto Symbols with strong pointers, 
		so they will be in outPointers"
	(newRoots := self rootsIncludingPlayers) ifNotNil:
		[arrayOfRoots := newRoots].		"world, presenter, and all Player classes"
	"Creation of the segment happens here"
	self copyFromRoots: arrayOfRoots sizeHint: 0.
	segSize := segment size.
	[(newRoots := self rootsIncludingBlockMethods) == nil] whileFalse:
		[arrayOfRoots := newRoots.
		self copyFromRoots: arrayOfRoots sizeHint: segSize].
		"with methods pointed at from outside"
	[(newRoots := self rootsIncludingBlocks) == nil] whileFalse:
		[arrayOfRoots := newRoots.
		self copyFromRoots: arrayOfRoots sizeHint: segSize].
		"with methods, blocks from outPointers"
	"Zap sender of a homeContext. Can't send live stacks out." "Why not? eem 7/3/2017 15:31"
	1 to: outPointers size do: [:ii | | outPointer |
		outPointer := outPointers at: ii.
		(outPointer isBlock
		 or: [outPointer isContext]) ifTrue: [outPointers at: ii put: nil]].
	symbolHolder size "Keep reference to symbolHolder until the last"