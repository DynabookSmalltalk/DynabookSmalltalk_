accessing
convertToCurrentVersion: varDict refStream: smartRefStrm 
	
	(setValueSelector = #scrollBarValue:) ifTrue:[self setValueSelector: #vScrollBarValue:].
	^ super convertToCurrentVersion: varDict refStream: smartRefStrm