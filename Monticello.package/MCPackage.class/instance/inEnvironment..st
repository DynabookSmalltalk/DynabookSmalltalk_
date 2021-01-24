environments
inEnvironment: anEnvironment
	"Answer a decorator for me that activates anEnvironment for certain operations."
	^ MCPackageInEnvironment decorating: self in: anEnvironment