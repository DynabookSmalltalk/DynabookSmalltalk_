instruction decoding
storeIntoTemporaryVariable: offset
	stack addLast: (offset >= tempVars size
						ifTrue: "Handle the case of chained LiteralVariableBinding assigments"
							[stack at: (offset + 1 - tempVars size)]
						ifFalse: "A regular argument or temporary"
							[tempVars at: offset + 1]).
	self doStore: stack