accessing
adoptPaneColor: paneColor
	super adoptPaneColor: paneColor.
	
	"May not be in the hierarchy at the moment."
	scrollBar adoptPaneColor: paneColor.
	hScrollBar adoptPaneColor: paneColor.

	paneColor ifNotNil: [:pc | self borderColor: ((self userInterfaceTheme borderColorModifier ifNil: [ [:c | c adjustBrightness: -0.3] ]) value: pc)].