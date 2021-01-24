visiting
visitBlockNode: aBlockNode
	| savedPrecedingStatement |
	(theSelectBlock isNil or: [theSelectBlock value: aBlockNode]) ifFalse:
		[^nil].
	theBlock value: aBlockNode.
	savedPrecedingStatement := precedingStatement.
	precedingStatement := nil.
	[aBlockNode statements do:
		[:statement|
		 statement accept: self.
		 precedingStatement := statement]] ensure:
		[precedingStatement := savedPrecedingStatement]