operations
changesRelativeToRepository: aRepository 
	| ancestorVersion ancestorSnapshot |
	ancestorVersion := aRepository withCache
		closestAncestorVersionFor: ancestry
		ifNone: [ nil ].
	ancestorSnapshot := ancestorVersion
		ifNil: [ MCSnapshot empty ]
		ifNotNil: [ ancestorVersion snapshot ].
	^ package snapshot patchRelativeToBase: ancestorSnapshot