private
initializeWithVersion: aVersion repository: aRepository
	version := aVersion.
	repository := aRepository.
	ancestor := repository withCache closestAncestorVersionFor: version info ifNone: []. 
	changes := ancestor
				ifNil: [#()]
				ifNotNil: [(version snapshot patchRelativeToBase: ancestor snapshot) 							operations sorted]