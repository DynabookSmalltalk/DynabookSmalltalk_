drawing
testCache: anObject 
	| newEntry firstFree |
	cachingEnabled 
		ifFalse: 
			[cachedObjects := nil.
			^nil].
	cachedObjects ifNil: 
			[cachedObjects := (1 to: 100) collect: 
							[:x | 
							{ 
								WeakArray new: 1.
								nil.
								nil.
								nil}]].
	self purgeCache.
	firstFree := nil.
	cachedObjects withIndexDo: 
			[:each :index | | cachedObject | 
			cachedObject := each first first.
			firstFree ifNil: [cachedObject ifNil: [firstFree := index]].
			cachedObject == anObject 
				ifTrue: 
					[each at: 2 put: (each second) + 1.
					^{ 
						index.
						false.
						each}]].
	firstFree ifNil: [^nil].
	newEntry := { 
				WeakArray with: anObject.
				1.
				Time millisecondClockValue.
				nil}.
	cachedObjects at: firstFree put: newEntry.
	^{ 
		firstFree.
		true.
		newEntry}