private-files
allVersionNames

	^allVersionNamesCache ifNil: [
		self readableFileNames collect: [ :each | each versionName ] ]