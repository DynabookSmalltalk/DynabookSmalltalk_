initialize-release
setRepository: aFileBasedRepository workingCopy: aWorkingCopy 
	order := self class order.
	repository := aFileBasedRepository.
	self refresh.
	aWorkingCopy
		ifNil: [ self packageSelection: 1 ]
		ifNotNil:
			[ selectedPackage := aWorkingCopy ancestry ancestors ifNotEmpty:
				[ : ancestors | ancestors anyOne name asMCVersionName packageAndBranchName ] ].
	MCWorkingCopy addDependent: self