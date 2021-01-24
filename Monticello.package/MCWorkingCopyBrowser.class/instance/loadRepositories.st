actions
loadRepositories
	FileStream fileIn: 'MCRepositories.st'.
	self changed: #repositoryList.
	self changedButtons.
