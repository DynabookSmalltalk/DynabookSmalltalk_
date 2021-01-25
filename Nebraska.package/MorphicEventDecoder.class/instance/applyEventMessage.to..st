handling messages
applyEventMessage: aStringArray to: aHand
	| event |
	event := MorphicEvent fromStringArray: (aStringArray copyFrom: 2 to: aStringArray size).
	event ifNotNil:[aHand queueEvent: event].