*system
suggestedTypeNames
	
	^ Array streamContents: [:stream |
		self findFeatureIndicesDo: [:start :end |
			(self at: start) isUppercase ifTrue: [
				stream nextPut: (self copyFrom: start to: end).
				end ~= self size ifTrue: [
					stream nextPut: (self copyFrom: start to: self size) withBlanksTrimmed].
				"Often, argument names that refer to Collections end in the letter s, which can cause the suggested type-name to not be found. Account for this."
				(self at: end) = $s ifTrue: [
					stream nextPut: (self copyFrom: start to: end -1)]]]].