accessing
findDelimiters: delimiters startingAt: start 
	"Answer the index of the character within the receiver, starting at start, that matches one of the delimiters. If the receiver does not contain any of the delimiters, answer size + 1."

	delimiters size = 1 ifTrue: [ ^self indexOf: delimiters anyOne startingAt: start ifAbsent: self size + 1 ].
	^self indexOfAnyOf: delimiters startingAt: start ifAbsent: self size + 1