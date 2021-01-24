actions
addPackageRepository

	workingCopy ifNotNil:
		[
		(self pickRepositorySatisfying: [ :repos | (workingCopy repositoryGroup includes: repos) not ])
			ifNotNil:
				[:repos |
					workingCopy repositoryGroup addRepository: repos.
					self repository: repos.	
					self
						changed: #repositoryList;
						changed: #repositorySelection.
					self changedButtons]]