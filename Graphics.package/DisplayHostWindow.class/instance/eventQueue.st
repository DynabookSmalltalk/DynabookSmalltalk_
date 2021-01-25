accessing
eventQueue
	^eventQueue ifNil: [eventQueue := SharedQueue new]
