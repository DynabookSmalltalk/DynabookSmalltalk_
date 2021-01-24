accessing
packageAndBranchName
	^ name
		ifNil: [ self name ]
		ifNotNil: [ name asMCVersionName packageAndBranchName ]