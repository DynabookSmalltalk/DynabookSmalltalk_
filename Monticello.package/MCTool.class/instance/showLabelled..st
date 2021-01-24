morphic ui
showLabelled: labelString
	modalProcess := nil.
	self label: labelString.
	^(self window)
		openInWorldExtent: self defaultExtent;
		yourself