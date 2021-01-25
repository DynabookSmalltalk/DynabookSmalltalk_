stuff
getChoice: aSymbol

	aSymbol == #playOnArrival ifTrue: [^self class playOnArrival].
	aSymbol == #transmitWhileRecording ifTrue: [^self transmitWhileRecording].
	aSymbol == #handsFreeTalking ifTrue: [^self handsFreeTalking].

