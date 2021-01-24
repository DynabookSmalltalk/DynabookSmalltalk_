layout-properties
vResizing: aSymbol

	super vResizing: aSymbol.
	
	self autoFit: aSymbol == #shrinkWrap.

	 self wrapDirection: (aSymbol == #shrinkWrap
		ifTrue: [#topToBottom]
		ifFalse: [#none]).
		
	self releaseParagraph.