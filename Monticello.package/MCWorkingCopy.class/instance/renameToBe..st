operations
renameToBe: newPackageName 
	| newWorkingCopy definitions |
	self modified ifTrue: [ self error: 'Should only rename an unmodified package.' ].
	(MCWorkingCopy allManagers anySatisfy:
		[ : each | each packageName = newPackageName ]) ifTrue: [ self error: newPackageName , ' is already taken.' ].
	definitions := self package snapshot definitions.
	PackageInfo registerPackageName: newPackageName.
	newWorkingCopy := (MCWorkingCopy forPackage: (MCPackage new name: newPackageName))
		 repositoryGroup: self repositoryGroup ;
		 requiredPackages: self requiredPackages copy ;
		 modified: true ;
		 yourself.
	definitions do:
		[ : each | each
			handlePackageRename: self package name
			to: newPackageName ].
	self ancestors do:
		[ : each | newWorkingCopy ancestry addAncestor: each ].
	newWorkingCopy package snapshot definitions size = definitions size ifTrue:
		[ PackageOrganizer default unregisterPackage: (PackageInfo named: self packageName).
		self unregister ].
	^ newWorkingCopy