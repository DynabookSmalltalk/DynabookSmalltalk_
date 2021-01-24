printing
pushFullClosure: aCompiledBlock numCopied: numCopied
	| literalIndex |
	literalIndex := method literals identityIndexOf: aCompiledBlock.
	literalIndex = 0
		ifTrue:
			[self print: 'closureNumCopied: ', numCopied printString
				, ' numArgs: ', aCompiledBlock numArgs printString]
		ifFalse:
			[self print: 'pushFullClosure: (self literalAt: ', literalIndex printString,
						') numCopied: ', numCopied printString,
						' "numArgs: ', aCompiledBlock numArgs printString, '"'].
	
	fullBlockRecursionSelector ifNotNil:
		[(self class on: aCompiledBlock)
			indent: indent + 1;
			perform: fullBlockRecursionSelector with: stream]