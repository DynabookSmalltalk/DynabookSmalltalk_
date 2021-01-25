testing
isPlaying: aBoolean

	isPlaying = aBoolean ifTrue: [^self].
	isPlaying := aBoolean.
	self changed: #isPlaying	