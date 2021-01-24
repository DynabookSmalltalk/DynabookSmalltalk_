layout
hResizing: aSymbol
	"Pass #shrinkWrap property to scroller to make this scroll pane's layout work. See #doLayoutIn:."

	super hResizing: aSymbol.
	
	scroller hResizing: (aSymbol == #shrinkWrap
		ifTrue: [#shrinkWrap]
		ifFalse: [#spaceFill]).