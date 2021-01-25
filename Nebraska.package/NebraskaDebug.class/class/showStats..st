as yet unclassified
showStats: queueName

	DEBUG ifNil: [^Beeper beep].
	self 
		showStats: queueName 
		from: DEBUG.
