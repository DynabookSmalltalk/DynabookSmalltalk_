private
materializeInfo
	workingCopy ancestry breadthFirstAncestorsDo:
		[ : each | (repository versionWithInfo: each) ifNotNil:
			[ : ver | ^ ver info allAncestorsDo:
				[ : eachAncestor | eachAncestor = info ifTrue: [ ^ eachAncestor ] ] ] ].
	nil error: 'Expected ' , info asString , ' to be an ancestor of one of ' , workingCopy ancestors asString