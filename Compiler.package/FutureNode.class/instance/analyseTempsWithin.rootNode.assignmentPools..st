closure analysis
analyseTempsWithin: scopeBlock "<BlockNode>" rootNode: rootNode "<MethodNode>" assignmentPools: assignmentPools "<Dictionary>"
	{ receiver. futureDelta }, (futureArgs ifNil: [#()]) do:
		[:node|
		node == nil ifFalse:
			[node analyseTempsWithin: scopeBlock rootNode: rootNode assignmentPools: assignmentPools]]