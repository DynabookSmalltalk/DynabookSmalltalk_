filtering
filterTerm: aString

	lastKeystrokes = aString ifTrue: [^ self].
	lastKeystrokes := aString.
	self updateListFilter.