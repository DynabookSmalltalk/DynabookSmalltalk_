morphic ui
workingCopyTree
	^ self workingCopies collect:[:each| MCDependentsWrapper with: each model: self].