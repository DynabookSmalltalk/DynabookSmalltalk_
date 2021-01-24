copying
postCopy
	1 to: self numLiterals - 1 do:
		[:index| | lit |
		 (lit := self literalAt: index) isCompiledCode ifTrue:
			[lit outerCode: self; postCopy]]