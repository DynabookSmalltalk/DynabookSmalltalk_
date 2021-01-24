applying
applyTo: anObject
	self isMerged ifFalse: [self error: 'You must resolve all the conflicts first'].
	conflicts do: [:ea | ea applyTo: anObject]