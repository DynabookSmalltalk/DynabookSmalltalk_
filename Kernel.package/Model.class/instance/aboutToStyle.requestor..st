morphic ui
aboutToStyle: aStyler requestor: anObject
	"View-specific extension for styling. Overwrite this method to configure the styler with view-specific information."

	^ self aboutToStyle: aStyler