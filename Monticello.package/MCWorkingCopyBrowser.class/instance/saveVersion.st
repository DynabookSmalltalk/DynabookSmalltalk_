actions
saveVersion
	| repo |
	self canSave ifFalse: [^self].
	self checkForNewerVersions ifFalse: [^self].
	repo := self repository.
	(repo == MCRepository trunk and: [SystemVersion current isFeatureFreeze])
		ifTrue: [self inform: 'FEATURE FREEZE. A new release is being prepared.\Please do only do bugfixes, but no new features.' translated withCRs].
	(repo == MCRepository trunk and: [SystemVersion current isCodeFreeze])
		ifTrue: [self inform: 'CODE FREEZE. The new release is almost ready.\Please do only do URGENT fixes, if any.' translated withCRs].
				
	(self withRepository: repo do: [workingCopy newVersion]) ifNotNil:
		[:v |
		(MCVersionInspector new version: v) show.
		Cursor wait showWhile: [repo storeVersion: v].
		MCCacheRepository default cacheAllFileNamesDuring: 
			[repo cacheAllFileNamesDuring: 
				[v allAvailableDependenciesDo:
					[:dep |
					(repo includesVersionNamed: dep info name)
						ifFalse: [repo storeVersion: dep]]]]]