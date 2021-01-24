initialize-release
initializeWithPackage: aPackage
	package := aPackage inEnvironment: Environment current.
	self initialize.