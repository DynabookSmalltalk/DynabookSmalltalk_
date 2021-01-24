actions
addRepositoryToWorkingCopy
	workingCopy ifNotNil:
		[:wc |
			workingCopy repositoryGroup addRepository: self repository.
			self
				changed: #workingCopySelection;
				changed: #repositoryList;
				changed: #repositorySelection.
			self changedButtons]