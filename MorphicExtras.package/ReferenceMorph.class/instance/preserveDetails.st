menu
preserveDetails
	"The receiver is being switched to use a different format.  Preserve the existing details (e.g. wording if textual, grapheme if graphical) so that if the user reverts back to the current format, the details will be right"

	self isCurrentlyTextual
		ifTrue:
			[self setProperty: #priorWording toValue: self existingWording.
			self setProperty: #priorColor toValue: self color.
			self setProperty: #priorBorderWidth toValue: self borderWidth]
		ifFalse:
			[self setProperty: #priorGraphic toValue: self firstSubmorph form]