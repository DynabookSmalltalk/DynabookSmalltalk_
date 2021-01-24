installing
postload
	self isInitializer
		ifTrue: [self actualClass theNonMetaClass initialize].
	self isExternalStructureFieldDefinition
		ifTrue: [self actualClass theNonMetaClass compileFields].