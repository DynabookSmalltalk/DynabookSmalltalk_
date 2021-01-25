private
placeEmbeddedObjectFrom: aTextAttribute
	
	| width anchoredMorphOrForm textAnchorProperties |
	anchoredMorphOrForm := aTextAttribute anchoredMorph.
	textAnchorProperties := self textAnchorPropertiesFor: anchoredMorphOrForm.
	
	textAnchorProperties anchorLayout == #document ifTrue: [^ true].
	width := textAnchorProperties consumesHorizontalSpace 
		ifTrue: [anchoredMorphOrForm width + textAnchorProperties horizontalPadding]
		ifFalse: [0].
	
	lastCharacterWidth := width.	
	
	(destX + width > characterPoint x) ifTrue: [^false].
	destX := destX + width + kern.
	^ true