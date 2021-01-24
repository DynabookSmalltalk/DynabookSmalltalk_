morphic ui
versionList
	| result |
	result := selectedPackage
				ifNil: [ self versionNamesForNoPackageSelection ]
				ifNotNil: [ self versionNamesForSelectedPackage ].
	(self orderSpecs at: order) value ifNotNil:
		[ : sortBlock |
		result sort: sortBlock ].
	^result collect:
		[ : each | self versionHighlight: each ]