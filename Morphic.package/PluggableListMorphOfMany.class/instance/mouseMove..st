event handling
mouseMove: event 
	"The mouse has moved, as characterized by the event provided.  Adjust the scrollbar, and alter the selection as appropriate"

	| row index |
	event position y < self top 
		ifTrue: 
			[scrollBar scrollUp: 1.
			row := self rowAtLocation: scroller topLeft + (1 @ 1)]
		ifFalse: 
			[row := event position y > self bottom 
				ifTrue: 
					[scrollBar scrollDown: 1.
					self rowAtLocation: scroller bottomLeft + (1 @ -1)]
				ifFalse: [ self rowAtLocation: event position]].
	row = 0 ifTrue: [^super mouseDown: event].
	index := self modelIndexFor: row.

	model okToChange ifFalse: [^self].	"No change if model is locked"

	dragOnOrOff ifNil: [
		"Was not set at mouse down, which means the mouse must have gone down in an area where there was no list item"
		dragOnOrOff := (self listSelectionAt: index) not].

	self changeModelSelection: index.
	self listSelectionAt: index put: dragOnOrOff.