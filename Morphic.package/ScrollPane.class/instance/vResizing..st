layout
vResizing: aSymbol
	"Pass #shrinkWrap property to scroller to make this scroll pane's layout work. See #doLayoutIn:."

	super vResizing: aSymbol.
	
	scroller vResizing: (aSymbol == #shrinkWrap
		ifTrue: [#shrinkWrap]
		ifFalse: [#spaceFill]).