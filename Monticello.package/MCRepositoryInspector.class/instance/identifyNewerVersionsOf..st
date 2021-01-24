initialize-release
identifyNewerVersionsOf: aMCWorkingCopy 
	(repository possiblyNewerVersionsOfAnyOf: aMCWorkingCopy ancestry names) do:
		[ : eachNewerVersionName |
		newer add: (self class browseBranchedVersionsSeparately
						ifTrue: [ eachNewerVersionName packageAndBranchName ]
						ifFalse: [ eachNewerVersionName packageName ]) ]