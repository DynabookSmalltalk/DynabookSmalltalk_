private
placeEmbeddedObjectFrom: aTextAttribute
	
	| width anchoredMorphOrForm textAnchorProperties |
	anchoredMorphOrForm := aTextAttribute anchoredMorph.
	textAnchorProperties := self textAnchorPropertiesFor: anchoredMorphOrForm.
	
	(self embeddedObject: anchoredMorphOrForm shouldBePlacedInDocumentGiven: textAnchorProperties) 
			ifTrue: [^ self placeEmbeddedObjectInDocument: anchoredMorphOrForm].
	self placeEmbeddedObject: anchoredMorphOrForm inlineGiven: textAnchorProperties.
	
	width := textAnchorProperties consumesHorizontalSpace 
				ifTrue: [anchoredMorphOrForm width + textAnchorProperties horizontalPadding]
				ifFalse: [0].
	destX := destX + width + kern.
	
	^ true