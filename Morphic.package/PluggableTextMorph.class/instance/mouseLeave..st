event handling
mouseLeave: event
	"Save the selection interval for later."

	self flag: #fixIntervalCache. "mt: We should find a better design for discarding unused text editors in text morphs and restoring them on demand."
	selectionInterval := textMorph editor markIndex to: textMorph editor pointIndex -1.

	super mouseLeave: event.

	Preferences mouseOverForKeyboardFocus
		ifTrue: [event hand releaseKeyboardFocus: self]