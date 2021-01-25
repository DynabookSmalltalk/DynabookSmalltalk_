private-accessing
eventSelector

	^self class eventSelectorBlock
		value: self itemKind
		value: self changeKind