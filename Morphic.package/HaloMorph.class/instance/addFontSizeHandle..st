handles
addFontSizeHandle: haloSpec 
	(innerTarget isTextMorph) 
		ifTrue: 
			[self 
				addHandle: haloSpec
				on: #mouseUp
				send: #chooseFont
				to: innerTarget]