events
doButtonUpAction
	(target notNil and: [actionUpSelector notNil]) 
		ifTrue: [Cursor normal showWhile: [target perform: actionUpSelector]]