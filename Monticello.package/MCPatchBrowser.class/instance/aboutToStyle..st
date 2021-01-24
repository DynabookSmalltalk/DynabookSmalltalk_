styling
aboutToStyle: aStyler 
	
	selection ifNotNil: [
		selection isConflict ifTrue: [ ^false ].
		(selection isAddition or: [ selection isRemoval ]) ifTrue: [
			selection definition isOrganizationDefinition ifTrue: [ ^false ].
				aStyler classOrMetaClass: self selectedClassOrMetaClass.
				^true ] ].
	^false