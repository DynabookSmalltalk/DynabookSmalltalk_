initialize-release
stubAncestryFor: aMCWorkingCopy using: aMCRepository 
	"childInfo was retrieved from aMCRepository.  Replace my ancestry with a Proxy that can retrieve the full tree from these two elements."
	ancestors := ancestors collect:
		[ : each | each isMCInfoProxy
			ifTrue: [ each ]
			ifFalse:
				[ MCInfoProxy
					info: each copyWithTrimmedAncestry
					workingCopy: aMCWorkingCopy
					repository: aMCRepository ] ].
	stepChildren := stepChildren collect:
		[ : each | each isMCInfoProxy
			ifTrue: [ each ]
			ifFalse:
				[ MCInfoProxy
					info: each copyWithTrimmedAncestry
					workingCopy: aMCWorkingCopy
					repository: aMCRepository ] ]