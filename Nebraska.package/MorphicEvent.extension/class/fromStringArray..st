*nebraska-Morphic-Remote
fromStringArray: array
	"decode an event that was encoded with encodedAsStringArray"
	| type |
	type := (array at: 1).
	(type = 'mouseMove')
		ifTrue:[^MouseMoveEvent new decodeFromStringArray: array].
	(type = 'mouseDown' or:[type = 'mouseUp']) 
		ifTrue:[^MouseButtonEvent new decodeFromStringArray: array].
	(type = 'keystroke' or:[type = 'keyDown' or:[type = 'keyUp']]) 
		ifTrue:[^KeyboardEvent new decodeFromStringArray: array].
	^nil