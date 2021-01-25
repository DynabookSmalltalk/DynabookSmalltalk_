private
embeddedObject: anchoredMorphOrForm shouldBePlacedInDocumentGiven: textAnchorProperties
	
	^ textAnchorProperties hasPositionInDocument 
		and: [textAnchorProperties anchorLayout == #document] 
		and: [anchoredMorphOrForm isMorph]