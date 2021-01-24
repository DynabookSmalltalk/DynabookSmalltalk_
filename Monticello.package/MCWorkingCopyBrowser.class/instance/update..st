morphic ui
update: aSymbol
	self unsortedWorkingCopies do: [:ea | ea addDependent: self].
	self workingCopyListChanged.