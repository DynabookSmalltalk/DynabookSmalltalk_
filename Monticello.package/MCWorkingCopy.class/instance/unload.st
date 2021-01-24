operations
unload
	self withEnvironmentActiveDo: [MCPackageLoader unloadPackage: self package].
	self unregisterSubpackages.
	self unregister.