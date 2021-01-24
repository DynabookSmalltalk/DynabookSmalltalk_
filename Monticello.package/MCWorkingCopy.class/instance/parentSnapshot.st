private
parentSnapshot
	"prefer parent in selected repository"
	MCRepositoryRequest signal ifNotNil: [:repo |
		self ancestors do: [:ancestor |
			(repo versionWithInfo: ancestor)
				ifNotNil: [:ver | ^ver snapshot]]].
	"otherwise, look in all repositories"
	self ancestors do: [:ancestor |
		(self repositoryGroup versionWithInfo: ancestor)
			ifNotNil: [:ver | ^ver snapshot]].
	"otherwise"
	^MCSnapshot empty