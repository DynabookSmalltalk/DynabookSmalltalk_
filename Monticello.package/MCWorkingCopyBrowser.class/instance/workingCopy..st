morphic ui
workingCopy: wc
	workingCopy := wc.
	self
		changed: #workingCopySelection;
		changed: #repositoryList;
		changed: #repositorySelection.
	self changedButtons.
