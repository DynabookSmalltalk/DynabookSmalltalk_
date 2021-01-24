objects from disk
convertToCurrentVersion: varDict refStream: smartRefStrm 
	scrollBarThickness
		ifNil: [scrollBarThickness := self class scrollBarThickness].
	hScrollBarPolicy
		ifNil: [hScrollBarPolicy := #whenNeeded].
	vScrollBarPolicy
		ifNil: [vScrollBarPolicy := #whenNeeded].
	hScrollBar
		ifNil: [(hScrollBar := ScrollBar on: self getValue: nil setValue: #hScrollBarValue:) 
			       menuSelector: #hScrollBarMenuButtonPressed:;
				 orientation: #horizontal;
				 extent: 1 @ 1].
	^ super convertToCurrentVersion: varDict refStream: smartRefStrm