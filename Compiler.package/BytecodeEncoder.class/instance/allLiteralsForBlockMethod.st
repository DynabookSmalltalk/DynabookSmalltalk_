results
allLiteralsForBlockMethod
	addedExtraLiterals ifFalse:
		[addedExtraLiterals := true.
		"Put the optimized selectors in literals so as to browse senders more easily"
		optimizedSelectors := optimizedSelectors reject: [:e| literalStream originalContents hasLiteral: e].
		optimizedSelectors isEmpty ifFalse: [
			"Use one entry per literal if enough room, else make anArray"
			literalStream position + optimizedSelectors size + 2 >= self maxNumLiterals
				ifTrue: [self litIndex: optimizedSelectors asArray]
				ifFalse: [optimizedSelectors do: [:e | self litIndex: e]]].
		"Add a slot for outerCode"
		self litIndex: nil].
	^literalStream contents