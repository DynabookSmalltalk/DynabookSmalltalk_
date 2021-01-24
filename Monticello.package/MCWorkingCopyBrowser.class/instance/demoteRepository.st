actions
demoteRepository
	self repository ifNotNil:
		[ : repo | self repositoryGroup demoteRepository: repo.
		self
			 changed: #repositoryList ;
			 changed: #repositorySelection ]