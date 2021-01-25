testing
isSaving: aBoolean

	isSaving = aBoolean ifTrue: [^self].
	isSaving := aBoolean.
	self changed: #isSaving