comparing
childrenOver: threshold

	| hereTally last children |
	receivers basicSize = 0 ifTrue: [^#()].
	hereTally := tally.
	children := receivers select:  "subtract subNode tallies for primitive hits here"
		[:child |
		hereTally := hereTally - child tally.
		child tally > threshold].
	hereTally > threshold ifTrue:
		[last := MessageTally new class: class method: method nesting: blockNesting.
		 last process: process.
		 last reportOtherProcesses: reportOtherProcesses.
		 ^children copyWith: (last primitives: hereTally)].
	^children