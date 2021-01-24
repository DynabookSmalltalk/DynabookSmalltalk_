scanning
scanForInstructionPattern: tuple
	"Convenient use of scanForInstructionSequence:
	 e.g. self systemNavigation browseAllSelect: [:m| m scanForInstructionPattern: #((pushConstant: true) (send:super:numArgs: spilled: false 1))]
	        self systemNavigation browseAllSelect: [:m| m scanForInstructionPattern: #((send:super:numArgs: arguments false 0) (send:super:numArgs: = false 1))]"
	| first firstArgs second secondArgs third thirdArgs |
	^(InstructionStream on: self) scanForInstructionSequence:
		(tuple size caseOf: {
			[1]	-> [first := tuple first.
					firstArgs := first allButFirst.
					first := first first.
					[:a|
					 a selector == first and: [a arguments = firstArgs]]].
			[2]	-> [first := tuple first.
					firstArgs := first allButFirst.
					second := tuple second.
					secondArgs := second allButFirst.
					first := first first.
					second := second first.
					[:a :b|
					 a selector == first and: [a arguments = firstArgs
					 and: [b selector == second and: [b arguments = secondArgs]]]]].
			[3]	-> [first := tuple first.
					firstArgs := first allButFirst.
					second := tuple second.
					secondArgs := second allButFirst.
					third := tuple third.
					thirdArgs := third allButFirst.
					first := first first.
					second := second first.
					third := third first.
					[:a :b :c|
					 a selector == first and: [a arguments = firstArgs
					 and: [b selector == second and: [b arguments = secondArgs
					 and: [c selector == third and: [c arguments = thirdArgs]]]]]]] })