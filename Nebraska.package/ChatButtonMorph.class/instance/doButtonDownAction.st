events
doButtonDownAction
	(target notNil and: [actionDownSelector notNil]) 
		ifTrue: [Cursor normal showWhile: [target perform: actionDownSelector]]