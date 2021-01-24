actions
withRepository: aRepository do: aBlock
	^aBlock
		on: MCRepositoryRequest
		do: [:req | req resume: aRepository]