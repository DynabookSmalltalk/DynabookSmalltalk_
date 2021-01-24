private
uniqueVersionName
	|versionName|
	counter := nil.
	[versionName := self nextVersionName.
	self repositoryGroup includesVersionNamed: versionName] whileTrue.
	^ versionName