fileIn/Out
acceptSingleMethodSource: aDictionary

	| oldClassInfo oldClassName ismeta newName actualClass selector |
	oldClassInfo := (aDictionary at: #oldClassName) findTokens: ' '.	"'Class' or 'Class class'"
	oldClassName := oldClassInfo first asSymbol.
	ismeta := oldClassInfo size > 1.

	"must use class var since we may not be the same guy who did the initial work"

	newName := RecentlyRenamedClasses ifNil: [
		oldClassName
	] ifNotNil: [
		RecentlyRenamedClasses at: oldClassName ifAbsent: [oldClassName]
	].
	actualClass := Smalltalk at: newName.
	ismeta ifTrue: [actualClass := actualClass class].
	selector := actualClass newParser parseSelector: (aDictionary at: #methodText).
	(actualClass compiledMethodAt: selector ifAbsent: [^self "hosed input"]) 
		putSource: (aDictionary at: #methodText)
		fromParseNode: nil
		class: actualClass
		category: (aDictionary at: #category)
		withStamp: (aDictionary at: #changeStamp)
		inFile: 2
		priorMethod: nil.
