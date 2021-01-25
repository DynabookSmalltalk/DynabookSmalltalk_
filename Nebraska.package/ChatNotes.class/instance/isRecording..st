testing
isRecording: aBoolean
	
	isRecording = aBoolean ifTrue: [^self].
	isRecording := aBoolean.
	self changed: #isRecording	