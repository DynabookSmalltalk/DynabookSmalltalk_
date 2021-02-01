search
showSearchPane
	"Set the receiver up so that it shows the search pane"

	| tabsPane aPane |
	modeSymbol == #search ifTrue: [ ^self ].

	self partsBin removeAllMorphs.

	tabsPane := self tabsPane.
	aPane := self newSearchPane.
	self replaceSubmorph: tabsPane by: aPane.

	self modeSymbol: #search.
	self showMorphsMatchingSearchString.
	ActiveHand newKeyboardFocus: aPane