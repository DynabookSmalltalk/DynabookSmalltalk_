event handling
specialKeyPressed: asciiValue

	(self arrowKey: asciiValue)
		ifTrue: [^ true].
		
	asciiValue = 27 "escape"
		ifTrue: [
			ActiveEvent shiftPressed
				ifTrue: [ActiveWorld putUpWorldMenuFromEscapeKey]
				ifFalse: [self yellowButtonActivity: false].
			^ true].
	
	^ false