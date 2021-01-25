read/write segment
copyFromRoots: aRootArray sizeHint: segSizeHint areUnique: areUnique
	"Copy a tree of objects into a WordArray segment.  The copied objects in the segment are not in the normal Squeak space.  
	[1] For exporting a project.  Objects were enumerated by ReferenceStream and aRootArray has them all.
	[2] For exporting some classes.  See copyFromRootsForExport:. (Caller must hold Symbols, or they will not get registered in the target system.)
	[3] For 'local segments'.  outPointers are kept in the image.
	If this method yields a very small segment, it is because objects just below the roots are pointed at from the outside.  (See findRogueRootsImSeg: for a *destructive* diagnostic of who is pointing in.)"
	| segmentWordArray outPointerArray segSize rootSet uniqueRoots |
	aRootArray ifNil: [self errorWrongState].
	uniqueRoots := areUnique 
		ifTrue: [aRootArray]
		ifFalse: [rootSet := IdentitySet new: aRootArray size * 3.
			uniqueRoots := OrderedCollection new.
			1 to: aRootArray size do: [:ii |	"Don't include any roots twice"
				(rootSet includes: (aRootArray at: ii)) 
					ifFalse: [
						uniqueRoots addLast: (aRootArray at: ii).
						rootSet add: (aRootArray at: ii)]
					ifTrue: [userRootCnt ifNotNil: ["adjust the count"
								ii <= userRootCnt ifTrue: [userRootCnt := userRootCnt - 1]]]].
			uniqueRoots].
	arrayOfRoots := uniqueRoots asArray.
	rootSet := uniqueRoots := nil.	"be clean"
	userRootCnt ifNil: [userRootCnt := arrayOfRoots size].
	outPointers := nil.	"may have used this instance before"
	segSize := segSizeHint > 0 ifTrue: [segSizeHint *3 //2] ifFalse: [50000].

	["Guess a reasonable segment size"
	segmentWordArray := WordArrayForSegment new: segSize.
	outPointerArray := [Array new: segSize // 20] ifError: [
		state := #tooBig.  ^ self].
	"Smalltalk garbageCollect."
	(self storeSegmentFor: arrayOfRoots
					into: segmentWordArray
					outPointers: outPointerArray) == nil]
		whileTrue:
			["Double the segment size and try again"
			segmentWordArray := outPointerArray := nil.
			segSize := segSize * 2].
	segment := segmentWordArray.
	outPointers := outPointerArray.
	state := #activeCopy