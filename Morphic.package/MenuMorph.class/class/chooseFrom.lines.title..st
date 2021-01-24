utilities
chooseFrom: aList lines: linesArray title: queryString
	"Choose an item from the given list. Answer the index of the selected item."
	| menu aBlock result |
	aBlock := [:v| result := v].
	menu := self new.
	menu addTitle: queryString.
	1 to: aList size do:[:i| 
		menu add: (aList at: i) asString target: aBlock selector: #value: argument: i.
		(linesArray includes: i) ifTrue:[menu addLine]].
	MenuIcons decorateMenu: menu.
	result := 0.
	menu invokeAt: ActiveHand position in: ActiveWorld allowKeyboard: true.
	^result