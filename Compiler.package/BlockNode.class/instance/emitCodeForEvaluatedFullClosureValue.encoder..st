code generation
emitCodeForEvaluatedFullClosureValue: stack encoder: encoder
	| position |
	position := stack position.
	self emitCodeExceptLast: stack encoder: encoder.
	(statements last == NodeNil
	 and: [self returns not])
		ifTrue:
			[stack push: 1.
			 encoder genReturnNilToCaller.
			 pc := encoder pc]
		ifFalse:
			[statements last emitCodeForBlockValue: stack encoder: encoder.
			 self returns ifFalse:
				[encoder genReturnTopToCaller.
				 pc := encoder pc]].
	self assert: stack position - 1 = position