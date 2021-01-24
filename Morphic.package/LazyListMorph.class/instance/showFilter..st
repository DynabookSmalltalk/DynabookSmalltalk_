accessing
showFilter: aBoolean

	showFilter = aBoolean ifTrue: [^ self].
	showFilter := aBoolean.
	self changed.