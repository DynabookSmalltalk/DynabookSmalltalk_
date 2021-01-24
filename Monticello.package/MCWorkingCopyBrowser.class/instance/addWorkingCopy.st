actions
addWorkingCopy
	|name|
	name := UIManager default request: 'Name of package:'.
	name isEmptyOrNil ifFalse:
		[PackageInfo registerPackageName: name.
		workingCopy := MCWorkingCopy forPackage: (MCPackage new name: name).
		workingCopyWrapper := nil.
		self repositorySelection: 0].
	self workingCopyListChanged; changed: #workingCopySelection; changed: #repositoryList.
	self changedButtons.