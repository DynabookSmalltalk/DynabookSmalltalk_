compiled method support
superSendScanBlockUsing: scanner
	"Answer a block argument for InstructionStream>>scanFor:
	 that answers true for super sends."
	^[:instr |
	   instr = 16r85
	   or: [instr = 16r84
		and: [scanner followingByte between: 16r20 and: 16r3F]]]