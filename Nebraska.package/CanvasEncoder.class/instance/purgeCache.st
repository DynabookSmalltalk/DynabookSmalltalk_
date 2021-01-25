drawing
purgeCache

	| spaceUsed spaceBefore s | 
	spaceBefore := spaceUsed := self purgeCacheInner.
	spaceBefore > 8000000 ifTrue: [
		Smalltalk garbageCollect.
		spaceUsed := self purgeCacheInner.
	].
	false ifTrue: [
		s := (spaceBefore // 1024) printString,'  ',(spaceUsed // 1024) printString,'  ',
			Time now printString,'     '.
		WorldState addDeferredUIMessage: [s displayAt: 0@0.].
	].
	^spaceUsed
