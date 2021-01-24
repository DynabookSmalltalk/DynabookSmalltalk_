instance creation
decorating: aPackage in: anEnvironment
	| instance |
	instance := self new.
	instance initializeWithPackage: aPackage in: anEnvironment.
	^ instance