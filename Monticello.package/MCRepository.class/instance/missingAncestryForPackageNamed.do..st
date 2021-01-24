versions
missingAncestryForPackageNamed: packageName do: oneArgBlock 
	| start |
	self cacheAllFileNamesDuring:
		[ start := self versionNamed: (self highestNumberedVersionNameForPackageNamed: packageName).
		self cacheAllFileNamesDuring:
			[ start info allAncestorsDo:
				[ : each | (self includesVersionNamed: each versionName) ifFalse: [ oneArgBlock value: each ] ] ] ]