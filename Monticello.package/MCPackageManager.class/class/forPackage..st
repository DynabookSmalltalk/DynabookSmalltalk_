instance creation
forPackage: aPackage
	^ self registry at: aPackage ifAbsent:
		[|mgr|
		mgr := self new initializeWithPackage: aPackage.
		self registry at: aPackage put: mgr.
		self changed: #allManagers.
		mgr]