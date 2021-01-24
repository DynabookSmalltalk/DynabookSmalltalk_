editor access
scrollSelectionIntoView: event 
	"Scroll my text into view. Due to line composition mechanism, we must never use the right of a character block because the lines last character block right value always comes from a global container and is *not* line specific."

	self flag: #fixIntervalCache. "mt: We should find a better design for discarding unused text editors in text morphs and restoring them on demand."
	selectionInterval := textMorph editor markIndex to: textMorph editor pointIndex - 1.
	
	textMorph editor hasSelection
		ifFalse: [self scrollToShow: (textMorph editor startBlock withWidth: 1)]
		ifTrue: [
			self scrollToShow: (textMorph editor startBlock topLeft corner: textMorph editor stopBlock bottomLeft).
			self scrollToShow: (textMorph editor pointBlock withWidth: 1). "Ensure text cursor visibility."].
		
	^ true