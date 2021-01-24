morphic ui
repositoryListMenu: aMenu
	"first add repository-specific commands"
	self repository ifNotNil:
		[ self
			fillMenu: aMenu
			fromSpecs:
				#(('open repository' #openRepository)
				('edit repository info' #editRepository)
				('add to package...' #addRepositoryToPackage)
				('remove repository' #removeRepository)
				('demote to bottom' #demoteRepository)
				('copy image versions here' #copyImageVersions)).
		aMenu
			add:
				(self repository alwaysStoreDiffs
					ifTrue: ['store full versions']
					ifFalse: ['store diffs'])
				target: self
				selector: #toggleDiffs ;
			addLine ].
	"then the non-specific commands"
	^self fillMenu: aMenu fromSpecs:
		#(	('load repositories' #loadRepositories)
		 	('save repositories' #saveRepositories)
			('flush cached versions' #flushCachedVersions))