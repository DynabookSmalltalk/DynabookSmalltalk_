versions
possiblyNewerVersionsOfAnyOf: versionNames 
	"Answer a collection of MCVersionNames which might be newer versions of the versions identified by versionNames."
	^self cacheAllFileNamesDuring: [
		versionNames
		inject: OrderedCollection new
		into:
			[ : coll : eachVersionName | | eachPackageName |
			eachPackageName := eachVersionName packageAndBranchName.
			(self versionNamesForPackageNamed: eachPackageName) do:
				[ : eachInSelf | (eachPackageName = eachInSelf packageAndBranchName and: [
					eachInSelf versionNumber > eachVersionName versionNumber or:
					[ eachInSelf versionNumber = eachVersionName versionNumber and: [ eachInSelf author ~= eachVersionName author ] ] ]) ifTrue: [ coll add: eachInSelf ] ].
			coll ] ]