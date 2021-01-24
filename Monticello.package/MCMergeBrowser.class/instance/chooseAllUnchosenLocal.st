actions
chooseAllUnchosenLocal
	conflicts do: [ :ea | ea isResolved ifFalse: [ ea chooseLocal ] ].
	self changed: #text; changed: #list; changed: #canMerge.