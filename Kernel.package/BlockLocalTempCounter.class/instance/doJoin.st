private
doJoin
	scanner pc < blockEnd ifTrue:
		[stackPointer := joinOffsets at: scanner pc ifAbsent: [scanner followingPc]]

	"the ifAbsent: handles a caseOf:otherwise: where all cases return, which results
	 in the branch around the otherwise being unreached.  e.g. in the following
		jumpTo: L2
	 is unreached.

		| t |
		t caseOf: { [nil] -> [^thisContext method abstractSymbolic] }
		  otherwise: ['Oh no Mr Bill!']

		pushTemp: 0
		pushConstant: nil
		send: #= (1 arg)
		jumpFalseTo: L1
		pushThisContext: 
		send: #method (0 args)
		send: #abstractSymbolic (0 args)
		returnTop
		jumpTo: L2
	L1:
		pushConstant: 'Oh no Mr Bill!'
	L2:
		returnTop"