handles
addFontEmphHandle: haloSpec 
	(innerTarget isTextMorph) 
		ifTrue: 
			[self 
				addHandle: haloSpec
				on: #mouseUp
				send: #chooseEmphasisOrAlignment
				to: innerTarget]