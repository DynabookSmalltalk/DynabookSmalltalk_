scanning
scanForInstructionSequence: naryBlock
	"naryBlock is a block taking one or more arguments.
	 Evaluate it for each sequence of instructions of length
	 n in the receiver until naryBlock evaluates to true.
	 Answer if naryBlock evaluated to true."
	^(InstructionStream on: self) scanForInstructionSequence: naryBlock
"
self systemNavigation browseAllSelect: [:m | m scanForInstructionSequence: [:msg| msg selector = #send:super:numArgs: and: [msg arguments second]]] localTo: thisContext class
"