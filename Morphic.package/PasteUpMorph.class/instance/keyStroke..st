event handling
keyStroke: anEvent
	"A keystroke has been made.  Service event handlers and, if it's a keystroke presented to the world, dispatch it to #unfocusedKeystroke:"

	| selected |
	super keyStroke: anEvent.  "Give event handlers a chance"

	selected := self selectedObject.
	selected isNil
		ifFalse:[ selected moveOrResizeFromKeystroke: anEvent ].

	(anEvent keyCharacter == Character tab) ifTrue:
		[self tabAmongFields
			ifTrue:[^ self tabHitWithEvent: anEvent]].
	self isWorldMorph ifTrue:
		[self keystrokeInWorld: anEvent]