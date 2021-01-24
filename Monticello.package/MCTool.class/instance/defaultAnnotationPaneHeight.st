morphic ui
defaultAnnotationPaneHeight 
	"Answer the receiver's preferred default height for new annotation panes.
	Since MC compares two annotations, reserve a bit less than a double the traditional height."
	
	^ Preferences standardDefaultTextFont height * 3