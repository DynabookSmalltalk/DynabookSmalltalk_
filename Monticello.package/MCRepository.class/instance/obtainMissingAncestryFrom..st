versions
obtainMissingAncestryFrom: sourceRepository 
	self cacheAllFileNamesDuring:
		[ self missingAncestryDo:
			[ : each | (sourceRepository includesVersionNamed: each versionName)
				ifTrue: [ self storeVersion: (sourceRepository versionNamed: each versionName) ]
				ifFalse: [ Notification signal: each versionName , ' not present in ' , sourceRepository asString ] ] ]