accessing
packageInfo
	"Activate my working copy's environment so the PackageInfo is added to the
	correct EnvironmentInfo's packages."
	| getPackageInfo |
	getPackageInfo := [PackageInfo named: name].
	^ self hasWorkingCopy
		ifTrue: [self workingCopy withEnvironmentActiveDo: getPackageInfo]
		ifFalse: getPackageInfo