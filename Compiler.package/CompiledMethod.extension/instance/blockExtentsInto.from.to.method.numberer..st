*Compiler-support
blockExtentsInto: aDictionary from: initialPC to: endPC method: method numberer: numbererBlock
	"Support routine for startpcsToBlockExtents"
	| pcs extentStart locator scanner blockSizeOrMethodOrLocator |
	self flag: 'belongs in DebuggerMethodMap'.
	extentStart := numbererBlock value.
	locator := BlockStartLocator new.
	scanner := InstructionStream new method: method pc: initialPC.
	pcs := OrderedCollection new.
	[pcs addLast: scanner pc.
	 scanner pc <= endPC] whileTrue:
		[blockSizeOrMethodOrLocator := scanner interpretNextInstructionFor: locator.
		 blockSizeOrMethodOrLocator ~~ locator ifTrue:
			 [blockSizeOrMethodOrLocator isInteger
				ifTrue:
					[self
						blockExtentsInto: aDictionary
						from: scanner pc
						to: scanner pc + blockSizeOrMethodOrLocator - 1
						method: method
						numberer: numbererBlock.
					 scanner pc: scanner pc + blockSizeOrMethodOrLocator]
				ifFalse:
					[self assert: blockSizeOrMethodOrLocator isCompiledBlock.
					 self
						blockExtentsInto: aDictionary
						from: blockSizeOrMethodOrLocator initialPC
						to: blockSizeOrMethodOrLocator endPC
						method: blockSizeOrMethodOrLocator
						numberer: numbererBlock]]].
	aDictionary
		at: (method isCompiledBlock
				ifTrue: [method]
				ifFalse: [initialPC])
		put: (extentStart to: numbererBlock value).
	^aDictionary