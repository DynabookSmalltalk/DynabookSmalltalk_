testing
isExternalStructureFieldDefinition
	^ selector = #fields
		and: [classIsMeta
			and: [
				(Smalltalk at: #ExternalStructure ifPresent: [:externalStructure |
					self actualClass theNonMetaClass inheritsFrom: externalStructure]) == true]]
			
	