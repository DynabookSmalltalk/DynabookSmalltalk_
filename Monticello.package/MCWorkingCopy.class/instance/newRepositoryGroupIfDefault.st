repositories
newRepositoryGroupIfDefault
	repositoryGroup == MCRepositoryGroup default
		ifTrue: [repositoryGroup := MCRepositoryGroup new].
	^ repositoryGroup