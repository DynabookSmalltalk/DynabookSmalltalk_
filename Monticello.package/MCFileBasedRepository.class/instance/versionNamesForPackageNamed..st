versions
versionNamesForPackageNamed: packageName
	^ Array streamContents:
		[ : stream | | wantBranch |
		wantBranch := packageName includes: $..
		self allFileNamesOrCache do:
			[ : each | | mcVersionName branchName |
			mcVersionName := each asMCVersionName.
			branchName := wantBranch
				ifTrue: [mcVersionName packageAndBranchName]
				ifFalse: [mcVersionName packageName].
			packageName = branchName ifTrue: [ stream nextPut: mcVersionName ] ] ]