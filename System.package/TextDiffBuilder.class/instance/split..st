private
split: aString
	"I return an Array of DiffElements containing the strings which are the lines extracted from aString. All lines contain the line separator characters, or not depending on preference."

	^Array streamContents: [ :stream |
		ignoreLineEndings
			ifTrue: [
				aString lineIndicesDo: [ :start :endWithoutSeparators :end |
					stream nextPut: (DiffElement string: (aString copyFrom: start to: endWithoutSeparators)) ] ]
			ifFalse: [
				aString lineIndicesDo: [ :start :endWithoutSeparators :end |
					stream nextPut: (DiffElement string: (aString copyFrom: start to: end)) ] ] ]