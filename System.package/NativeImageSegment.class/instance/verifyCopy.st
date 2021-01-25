testing
verifyCopy

	| copyOfRoots matchDict |
	copyOfRoots := self segmentCopy.
	matchDict := IdentityDictionary new.
	arrayOfRoots with: copyOfRoots do:
		[:r :c | self verify: r matches: c knowing: matchDict]