*Monticello-changeSet menu
monticelloChangeSetMenu: aMenu
	<changeSetMenuShifted: false>
	<menuPriority: 600>
	"Sigh, when implementing menu pragmas this is not what I had in mind..."
	aMenu add: 'delete Monticello load change sets' action: #deleteMonticelloChangeSets.
	(aMenu submorphs
						detect: [:m| m isMenuItemMorph and: [m contents beginsWith: 'destroy change set']]
						ifNone: []) ifNotNil:
		[:destroyItem| | item |
		aMenu removeMorph: (item := aMenu submorphs last).
		aMenu addMorph: item after: destroyItem].
	^aMenu