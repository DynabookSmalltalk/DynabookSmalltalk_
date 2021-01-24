morphic ui
workingCopyListMenu: aMenu
	workingCopy ifNil: [^ aMenu].
	self fillMenu: aMenu fromSpecs:
		#(('add required package' #addRequiredPackage)
			('clear required packages' #clearRequiredPackages)
			('add repository...' #addPackageRepository)
			('browse package' #browseWorkingCopy)
			('view changes' #viewChanges)
			('view history' #viewHistory)
			('search history' #searchHistory)
			('recompile package' #recompilePackage)
			('revert package...' #revertPackage)
			('unload package' #unloadPackage)
			('delete working copy' #deleteWorkingCopy)
			('inspect working copy' #inspectWorkingCopy)
			('rename package...' #renamePackage)
			('change environment...' #changeEnvironment)).
	(Smalltalk includesKey: #SARMCPackageDumper) ifTrue: [
		aMenu add: 'make SAR' target: self selector: #fileOutAsSAR
	].
	self fillMenu: aMenu fromSpecs:
		#(	addLine
			('check all packages for changes' #checkAllPackages)).
	self insertExternalMenuEntries: aMenu.
	^aMenu