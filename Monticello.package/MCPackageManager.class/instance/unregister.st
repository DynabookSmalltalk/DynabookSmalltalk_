operations
unregister
	self class registry
		removeKey: package
		ifAbsent: [ "Should not complain when trying to clean up." ].
	self class changed: #allManagers