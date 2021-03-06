geniestubs
isGestureStart: anEvent
	"This mouse down could be the start of a gesture, or the end of a gesture focus"

	anEvent hand isGenieEnabled
		ifFalse: [ ^false ].

	(self allowsGestureStart: anEvent)
		ifTrue: [^ true ].		"could be the start of a gesture"

	"otherwise, check for whether it's time to disable the Genie auto-focus"
	(anEvent hand isGenieFocused
		and: [anEvent whichButton ~= anEvent hand focusStartEvent whichButton])
			ifTrue: [anEvent hand disableGenieFocus].

	^false