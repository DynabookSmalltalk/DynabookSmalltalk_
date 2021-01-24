actions
selectNextUnresolvedConflict
	"Try and select the next unresolved conflict starting at current selection in the list, wrapping at beginning.
	If there is no more unresolved conflict, then simply move to next non conflict item in the list.
	This method makes assumption that conflicts are always sorted before non conflicts items."
	(self findListMorph: #list)
		ifNotNil:
			[:aMorph |
			| currentIndex nextUnresolvedIndex |
			currentIndex := aMorph getCurrentSelectionIndex min: conflicts size.
			nextUnresolvedIndex := (currentIndex + 1 to: currentIndex + conflicts size - 1)
				detect:
					[:i |
					| nextItem |
					((nextItem := conflicts atWrap: i) isKindOf: MCConflict)
						and: [nextItem isResolved not]]
				ifNone: [0].
			nextUnresolvedIndex = 0
				ifTrue: [items size > 1 ifTrue: [self selection: (aMorph getCurrentSelectionIndex max: conflicts size)  - conflicts size \\ items size + conflicts size + 1]]
				ifFalse: [self selection: nextUnresolvedIndex - 1 \\ conflicts size + 1].].