private-files
allFileNames

	| index |
	index := self displayProgress: 'Updating ', self description during: [
		self httpGet: self locationWithTrailingSlash, '?C=M;O=D' arguments: nil ].
	^index ifNotNil: [ self parseFileNamesFromStream: index ]