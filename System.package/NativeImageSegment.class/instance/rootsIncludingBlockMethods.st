read/write segment
rootsIncludingBlockMethods
	"Return a new roots array with more objects.  (Caller should store into rootArray.) Any CompiledMethods that create blocks will be in outPointers if the block is held outside of this segment.  Put such methods into the roots list.  Then ask for the segment again."

	| myClasses extras |
	userRootCnt ifNil: [userRootCnt := arrayOfRoots size].
	extras := OrderedCollection new.
	myClasses := OrderedCollection new.
	arrayOfRoots do: [:aRoot | aRoot class class == Metaclass ifTrue: [
					myClasses add: aRoot]].
	myClasses isEmpty ifTrue: [^ nil].	"no change"
	outPointers do: [:anOut | | gotIt | 
		anOut class == CompiledMethod ifTrue: [
			"specialized version of who"
			gotIt := false.
			myClasses detect: [:class |
				class methodsDo: [:m |
					m == anOut 
						ifTrue: [extras add: anOut.  gotIt := true]].
				gotIt] 
				ifNone: []
			].
	].
	extras := extras select: [:ea | (arrayOfRoots includes: ea) not].
	extras isEmpty ifTrue: [^ nil].	"no change"
	^ arrayOfRoots, extras