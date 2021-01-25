as yet unclassified
timeBetweenLastAccessAnd: currentTime

	lastRequests isEmpty ifTrue: [^0].
	^currentTime - lastRequests first first
