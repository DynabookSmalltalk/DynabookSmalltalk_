accessing
hScrollBarPolicy: aSymbol
	"The lazy list morph will never wrap its rows if they do not fit. Instead, they are just clipped. So, #spaceFill is fine if the horizontal scroll bar should never be visible."
	
	self checkScrollBarPolicy: aSymbol.
	
	aSymbol ~= #never
		ifTrue: [self listMorph hResizing: #shrinkWrap]
		ifFalse: [self listMorph hResizing: #spaceFill].
				
	^ super hScrollBarPolicy: aSymbol