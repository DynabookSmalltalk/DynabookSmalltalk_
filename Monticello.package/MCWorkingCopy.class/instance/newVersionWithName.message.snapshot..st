operations
newVersionWithName: nameString message: messageString snapshot: aSnapshot
	| info deps clean |
	info := ancestry infoWithName: nameString message: messageString.
	ancestry := MCWorkingAncestry new addAncestor: info.
	clean := (package snapshot patchRelativeToBase: aSnapshot) isEmpty.
	self modified: clean; modified: clean not. "hack to ensure label is updated"
	
	deps := self requiredPackages collect:
		[:ea | 
		MCVersionDependency
			package: ea
			info: ea workingCopy currentVersionInfo].

	^ MCVersion
		package: package
		info: info
		snapshot: aSnapshot
		dependencies: deps