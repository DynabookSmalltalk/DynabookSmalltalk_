private
indexForInserting: newObject

	| index low high |
	low := firstIndex.
	high := lastIndex.
	sortBlock
		ifNil: [ 
			[ low > high ] whileFalse: [ 
				index := (high + low) // 2.
				(array at: index) <= newObject
					ifTrue: [ low := index + 1 ]
					ifFalse: [ high := index - 1 ] ] ]
		ifNotNil: [ 
			[ low > high ] whileFalse: [ 
				index := (high + low) // 2.
				(sortBlock value: (array at: index) value: newObject)
					ifTrue: [ low := index + 1 ]
					ifFalse: [ high := index - 1 ] ] ].
	^low