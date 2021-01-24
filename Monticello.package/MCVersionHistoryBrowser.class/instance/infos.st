accessing
infos
	^ infos ifNil: [infos := ancestry topologicalAncestors]