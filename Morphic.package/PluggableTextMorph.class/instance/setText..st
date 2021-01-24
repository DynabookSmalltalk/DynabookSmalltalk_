model access
setText: aText

	textMorph newContents: aText.
	self hasUnacceptedEdits: false.
	self setScrollDeltas.	
	
	self flag: #performance. "mt: Needed only to redraw overlays such as the help text."
	self changed.