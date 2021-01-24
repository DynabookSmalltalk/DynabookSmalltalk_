actions
addRepository: aRepository
	self repository: aRepository.
	self repositoryGroup addRepository: aRepository.
	self changed: #repositoryList; changed: #repositorySelection.
	self changedButtons.