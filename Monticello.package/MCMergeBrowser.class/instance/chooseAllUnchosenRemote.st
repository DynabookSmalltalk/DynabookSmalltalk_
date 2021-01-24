actions
chooseAllUnchosenRemote
	conflicts do: [ :ea | ea isResolved ifFalse: [ ea chooseRemote ] ].
	self changed: #text; changed: #list; changed: #canMerge.