layout
widthToDisplayItem: item 

	| labelWidth iconWidth leftMargin rightMargin |
	labelWidth := self font widthOfStringOrText: item asStringOrText.
	iconWidth := self listSource canHaveIcons ifTrue: [self iconExtent x] ifFalse: [0].
	leftMargin := self cellInset left.
	rightMargin := self cellInset right.
	^ leftMargin + iconWidth + labelWidth + rightMargin