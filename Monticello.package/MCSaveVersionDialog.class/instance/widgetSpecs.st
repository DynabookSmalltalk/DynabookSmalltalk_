ui
widgetSpecs
	^ #(	
		((listMorph:selection:menu:keystroke: list selection methodListMenu: methodListKey:from:) (0 0 0.5 0.6) (0 0 0 -47) )
		((inputMorph: versionName) (0.5 0 1 0) (0 0 0 defaultInputFieldHeight))
		((textMorph: logMessage) (0.5 0 1 0.6) (0 defaultInputFieldHeight 0 -47))
		((buttonRow) (0.5 0.6 1 0.6) (0 -47 0 0))
		((textMorph: annotations) (0 0.6 0.5 0.6) (0 -47 0 0))
		((textMorph: text) (0 0.6 1 1) (0 0 0 0))
		)