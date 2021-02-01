window definition
statusPane
	"Create and return the browser status pane."

	| pane |
	pane _ PluggableTextMorph on: self text: #status accept: nil.
pane  hideScrollBarsIndefinitely.
^pane