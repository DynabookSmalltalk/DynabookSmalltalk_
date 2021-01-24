morphic ui
initialize
	MCWorkingCopy addDependent: self.
	self workingCopies do: [:ea | ea addDependent: self].