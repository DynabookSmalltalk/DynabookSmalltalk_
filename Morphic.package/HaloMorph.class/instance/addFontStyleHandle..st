handles
addFontStyleHandle: haloSpec 
	(innerTarget isTextMorph) 
		ifTrue: 
			[self 
				addHandle: haloSpec
				on: #mouseUp
				send: #chooseStyle
				to: innerTarget]