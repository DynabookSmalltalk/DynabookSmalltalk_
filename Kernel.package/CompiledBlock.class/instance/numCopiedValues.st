accessing
numCopiedValues
	"Answer the number of copied values the receiver expects.
	 This is not fast as it is not expected to be needed from the
	 compiled block itself.  It is available cheaply from a block
	 closure for the method."

	| locator scanner pc |
	locator := BlockStartLocator new.
	scanner := InstructionStream on: self outerCode.
	[pc := scanner pc.
	 self == (scanner interpretNextInstructionFor: locator) ifTrue:
		[^(self outerCode abstractBytecodeMessageAt: pc) arguments second].
	 scanner atEnd] whileFalse.
	self error: 'cannot find the block creation bytecode for this compiled block in its outer code.'