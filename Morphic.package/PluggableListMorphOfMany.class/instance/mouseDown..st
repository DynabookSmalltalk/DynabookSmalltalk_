event handling
mouseDown: event
	| row index |
	event yellowButtonPressed ifTrue: [^ self yellowButtonActivity: event shiftPressed].
	row := self rowAtLocation: event position.

	row = 0 ifTrue: [^super mouseDown: event].
	index := self modelIndexFor: row.

	model okToChange ifFalse: [^ self].  "No change if model is locked"

	self changeModelSelection: index.

	"Set meaning for subsequent dragging of selection"
	self
		listSelectionAt: index
		put: (dragOnOrOff := (self listSelectionAt: index) not)
