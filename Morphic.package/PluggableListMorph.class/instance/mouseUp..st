event handling
mouseUp: event 

	| row |
	model okToChange ifFalse: [^ self].
	(self containsPoint: event position) ifFalse: [^ self].

	row := self rowAtLocation: event position.
	row = self selectionIndex
		ifTrue: [(autoDeselect ifNil: [true]) ifTrue: [row = 0 ifFalse: [self changeModelSelection: 0] ]]
		ifFalse: [self changeModelSelection: (self modelIndexFor: row)].
		
	event hand newKeyboardFocus: self. 
	hasFocus := true.
	Cursor normal show.