patch ops
addDefinition: new
	previousRemovals definitionLike: new
		ifPresent: [ :old | preloads add: (MCModification of: old to: new) ]
		ifAbsent: [ "ignore" ].
