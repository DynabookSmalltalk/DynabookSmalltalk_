menus
findMethodInChangeSets
	"Find and open a changeSet containing the current method."

	| aName |
	(aName := self selectedMessageName) ifNotNil: [
		ChangeSorter 
			browseChangeSetsWithClass: self selectedClassOrMetaClass
			selector: aName]