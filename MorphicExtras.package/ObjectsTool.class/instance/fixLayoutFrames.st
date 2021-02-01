layout
fixLayoutFrames
	"Adjust the boundary between the tabs or search pane and the parts bin, giving preference to the tabs."

	| oldY newY aTabsPane aTabsPaneHeight |
	oldY := ((aTabsPane := self tabsPane
						ifNil: [self searchPane])
				ifNil: [^ self]) layoutFrame bottomOffset.
	aTabsPaneHeight := aTabsPane hasSubmorphs
				ifTrue: [(aTabsPane submorphBounds outsetBy: aTabsPane layoutInset) height]
				ifFalse: [aTabsPane height].
	newY := (self buttonPane ifNil: [^ self]) height + aTabsPaneHeight.
	oldY = newY ifTrue: [^ self].
	aTabsPane layoutFrame bottomOffset: newY.
	(self partsBin ifNil: [^ self]) layoutFrame topOffset: newY.
	submorphs	do: [:m | m layoutChanged]