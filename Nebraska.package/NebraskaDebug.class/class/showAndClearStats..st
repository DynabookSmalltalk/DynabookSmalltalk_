as yet unclassified
showAndClearStats: queueName

	DEBUG ifNil: [^Beeper beep].
	self 
		showStats: queueName 
		from: DEBUG.
	DEBUG := nil.