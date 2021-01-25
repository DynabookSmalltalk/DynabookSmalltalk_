as yet unclassified
fullInfoString

	^self latestUserName,
		' at ',
		ipAddress ,
		' attempts: ',
		accessAttempts printString,
		'/',
		attempsDenied printString,
		' last: ',
		(self lastIncomingMessageTimeString)
	 
"acceptableTypes"

 