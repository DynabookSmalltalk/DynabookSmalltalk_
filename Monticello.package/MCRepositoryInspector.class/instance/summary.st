morphic ui
summary
	self selectedVersionIsFalseAncestor
		ifTrue: [^ (Text string: 'Beware, this is a false ancestor whose name conflicts with a true one\' withCRs attributes: {TextColor red. TextEmphasis bold})
				, super summary].
	^ super summary