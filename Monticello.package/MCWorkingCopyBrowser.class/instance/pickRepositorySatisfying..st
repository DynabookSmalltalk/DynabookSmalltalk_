morphic ui
pickRepositorySatisfying: aBlock
	| repos index |
	repos := MCRepositoryGroup default repositories select: aBlock.
	index := UIManager default chooseFrom: (repos collect: [:ea | ea description])
				title: 'Repository:'.
	^ index = 0 ifFalse: [repos at: index]