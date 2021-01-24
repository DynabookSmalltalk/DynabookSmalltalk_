versions
copyImageVersions
	"For each package contained in the receiver, copy the version of that package which is currently loaded in this image.  If no version of a package is loaded in the image, nothing is copied for that package."
	self cacheAllFileNamesDuring:
		[ self allPackageNames do:
			[ : eachPkgName | MCWorkingCopy allManagers
				detect: [ : each | each packageName = eachPkgName ]
				ifFound:
					[ : loaded | loaded ancestors do:
						[ : infoToCopy | (self includesVersionNamed: infoToCopy versionName) ifFalse:
							[ (MCRepositoryGroup default versionWithInfo: infoToCopy)
								ifNil: [ Warning signal: infoToCopy name , ' not found in RepositoryGroup default.' ]
								ifNotNilDo:
									[ : ver | self storeVersion: ver ] ] ] ]
				ifNone: [ "Image specifies no version to copy." ] ] ]