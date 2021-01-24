instruction decoding
pushTemporaryVariable: offset
	| node |
	offset >= tempVars size
				ifTrue: "Handle the case of chained LiteralVariableBinding assigments"
					[self halt.
					 node := stack at: offset + 1 - tempVars size]
				ifFalse: "A regular argument or temporary"
					[node := tempVars at: offset + 1.
					 node isArg ifFalse: "count temp reads for the whileTrue: => to:do: transformation."
						[tempReadCounts at: node put: (tempReadCounts at: node ifAbsent: [0]) + 1]].
	stack addLast: node