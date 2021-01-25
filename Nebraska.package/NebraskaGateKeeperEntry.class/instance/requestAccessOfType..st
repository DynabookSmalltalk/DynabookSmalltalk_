as yet unclassified
requestAccessOfType: aString

	| ok |

	accessAttempts := accessAttempts + 1.
	lastRequests addFirst: {Time totalSeconds. aString}.
	lastRequests size > 10 ifTrue: [
		lastRequests := lastRequests copyFrom: 1 to: 10.
	].
	ok := (acceptableTypes includes: aString) or: [acceptableTypes includes: 'all'].
	ok ifFalse: [attempsDenied := attempsDenied + 1].
	^ok