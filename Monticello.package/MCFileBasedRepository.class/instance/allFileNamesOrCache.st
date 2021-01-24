private-files
allFileNamesOrCache
	
	^allFileNamesCache ifNil: [ self allFileNames ]