ancestry
knownAncestorsOf: aVersionInfo
	^ aVersionInfo ancestors, (self stepParentsOf: aVersionInfo) asArray