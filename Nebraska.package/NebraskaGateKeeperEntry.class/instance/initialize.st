initialization
initialize

	self flag: #bob.		"need to decide better initial types"

	super initialize.
	ipAddress := '???'.
	accessAttempts := attempsDenied := 0.
	lastRequests := OrderedCollection new.
	acceptableTypes := Set withAll: NebraskaIncomingMessage allTypes.

 