tabs
initializeWithTabs: tabList
	"Initialize the receiver to have the given tabs"

	| oldPane newPane |
	oldPane := self tabsPane ifNil: [ self searchPane ].
	newPane := (self paneForTabs: tabList)
		setNameTo: 'TabPane';
		yourself.
	self replaceSubmorph: oldPane by: newPane.

