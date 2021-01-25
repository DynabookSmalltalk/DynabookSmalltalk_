testing method dictionary
includesSelector: aSymbol 
	self exists
		ifTrue: [^self realClass includesSelector: aSymbol]
		ifFalse: [
			"Not sure what the answer should be in this case (I'm unfamiliar with this class),
			 so I want to force an error rather than answer something nonsensical.  This is
			 no worse than the old behavior, when this method didn't even exist, resulting
			 in a MessageNotUnderstood error."
			self error: 'real class does not exist'
		]