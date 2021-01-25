as yet unclassified
toggleChoice: aString

	updateCounter := nil.		"force rebuild"
	aString = 'group' ifTrue: [^groupMode := (groupMode ifNil: [true]) not].
