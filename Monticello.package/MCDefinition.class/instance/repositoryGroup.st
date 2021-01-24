repositories
repositoryGroup
	"Answer the MCRepositoryGroup from which this this object was loaded."
	^ self workingCopy ifNotNil: [ : wc | wc repositoryGroup ]