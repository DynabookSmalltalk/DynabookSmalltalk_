private
placeEmbeddedObjectInDocument: anchoredMorphOrForm
	
	anchoredMorphOrForm position: 
			anchoredMorphOrForm textAnchorProperties positionInDocument +
			(anchoredMorphOrForm owner textBounds origin x @ (lineY - morphicOffset y)).
	^ true