accessing
isViewingRevisions
	^self items size > 1 and:
		[self items allSatisfy:
			[:each | each definition isRevisionOf: self items first definition]]