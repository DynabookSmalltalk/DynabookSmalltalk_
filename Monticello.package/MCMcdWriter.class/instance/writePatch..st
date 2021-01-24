visiting
writePatch: aPatch 
	| old new |
	old := OrderedCollection new.
	new := OrderedCollection new.
	aPatch operations do:
		[ : ea | ea isRemoval ifTrue: [ old add: ea definition ].
		ea isAddition ifTrue: [ new add: ea definition ].
		ea isModification ifTrue:
			[ old add: ea baseDefinition.
			new add: ea definition ] ].
	(old isEmpty and: [ new isEmpty ]) ifTrue: [ MCEmptyDiffyVersion signal ].
	self
		 writeOldDefinitions: old ;
		 writeNewDefinitions: new ;
		
		addString: (self serializeInBinary: aPatch)
		at: 'patch.bin'