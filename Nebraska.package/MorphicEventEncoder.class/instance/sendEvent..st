network I/O
sendEvent: anEvent
	(anEvent isMouseMove and: [ anEvent = lastEventSent ]) ifTrue: [
		"save on network traffic--don't send duplicate mouse moves"
		^self ].
	lastEventSent := anEvent.
	connection nextPut: #('event'), anEvent encodedAsStringArray