smart splitters - stepping
stopStepping
	super stopStepping.
	(self class smartVerticalSplitters or: [ self class smartHorizontalSplitters ]) ifFalse: [ self balanceOffsets ]