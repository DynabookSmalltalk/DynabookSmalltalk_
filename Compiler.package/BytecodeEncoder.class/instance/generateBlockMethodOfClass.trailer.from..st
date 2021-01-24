method encoding
generateBlockMethodOfClass: aCompiledBlockClass trailer: trailer from: blockNode
	"Generate a CompiledBlock for the block whose parse tree is blockNode."

	"The closure analysis should already have been done."
	| blkSize header literals locals method nLits stack |
	self assert: blockNode blockExtent notNil.
	self assert: rootNode notNil.
	blkSize := blockNode sizeCodeForEvaluatedFullClosureValue: self.
	locals := blockNode localsNodes.
	self noteBlockExtent: blockNode blockExtent hasLocals: locals.
	header := self computeMethodHeaderForNumArgs: blockNode arguments size
					numTemps: locals size
					numLits: (nLits := (literals := self allLiteralsForBlockMethod) size)
					primitive: 0.
	method := trailer
					createMethod: blkSize
					class: aCompiledBlockClass
					header: header.
	1 to: nLits do:
		[:lit |
		(method literalAt: lit put: (literals at: lit)) isCompiledCode ifTrue:
			[(literals at: lit) outerCode: method]].
	self streamToMethod: method.
	stack := ParseStack new init.
	stack position: method numTemps.
	blockMethod := method. "For BytecodeEncoder>>pc & BytecodeEncoder>>nextPC"
	[blockNode emitCodeForEvaluatedFullClosureValue: stack encoder: self]
		on: Error "If an attempt is made to write too much code the method will be asked"
		do: [:ex|  "to grow, and the grow attempt will fail in CompiledCode class>>#newMethodViaNewError"
			ex signalerContext sender method = (CompiledCode class>>#newMethodViaNewError)
				ifTrue: [^self error: 'Compiler code size discrepancy']
				ifFalse: [ex pass]].
	stack position ~= (method numTemps + 1) ifTrue:
		[^self error: 'Compiler stack discrepancy'].
	stream position ~= (method size - trailer size) ifTrue:
		[^self error: 'Compiler code size discrepancy'].
	method needsFrameSize: stack size - method numTemps.
	^method