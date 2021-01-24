*monticello
withLoadedPackageVersions
	"Everywhere the receiver contains a package version in the format:  PackageName-author.123 for which a version of that package is loaded in the image, answer a new String with each of those package versions changed to reflect the currently loaded version."
	| string |
	string := self.
	MCWorkingCopy allManagers do:
		[ : eachWorkingCopy | | start packageName |
		start := 1.
		packageName := eachWorkingCopy packageName.
		[ start := string
			findString: packageName
			startingAt: start.
		start > 0 and: [ string size > (start + packageName size + 4) ] ] whileTrue:
			[ | dot end versionName |
			dot := string
				indexOf: $.
				startingAt: (end := start + packageName size).
			dot > 0 ifTrue:
				[ end := (dot + 1 to: string size)
					detect: [ : n | (string at: n) isDigit not ]
					ifNone: [ 0 ].
				(end > (dot + 1) and:
					[ (dot + 1 to: end - 1) allSatisfy:
						[ : n | (string at: n) isDigit ] ])
					ifTrue:
						[ versionName := string
							copyFrom: start
							to: end - 1.
						versionName asMCVersionName packageName = packageName ifTrue:
							[ string := string
								copyReplaceTokens: versionName
								with: eachWorkingCopy ancestors first name ] ]
					ifFalse: [ end := start + packageName size ] ].
			start := end ] ].
	^ string