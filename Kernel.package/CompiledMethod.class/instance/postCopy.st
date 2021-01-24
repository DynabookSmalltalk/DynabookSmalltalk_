copying
postCopy
	| penultimateLiteral |
	(penultimateLiteral := self penultimateLiteral) isMethodProperties ifTrue:
		[self penultimateLiteral: penultimateLiteral copy].
	self encoderClass supportsFullBlocks ifTrue:
		[1 to: self numLiterals - 2 do:
			[:index| | lit |
			 (lit := self literalAt: index) isCompiledCode ifTrue:
				[lit outerCode: self; postCopy]]]