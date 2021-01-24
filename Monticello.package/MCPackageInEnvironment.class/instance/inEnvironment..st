initialize-release
inEnvironment: anEnvironment
	environment == anEnvironment ifTrue: [^ self].
	^ MCPackageInEnvironment decorating: package in: anEnvironment