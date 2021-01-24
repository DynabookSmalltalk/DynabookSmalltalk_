private
findSnapshotWithVersionInfo: aVersionInfo
	^ aVersionInfo
		ifNil: [MCSnapshot empty]
		ifNotNil: [(self repositoryGroup versionWithInfo: aVersionInfo)
			ifNil: [MCSnapshot empty]
			ifNotNil: [:aVersion | aVersion snapshot]]