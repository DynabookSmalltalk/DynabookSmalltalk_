ui
widgetSpecs
	Preferences annotationPanes ifFalse: [ ^#(
		((listMorph:selection:menu:keystroke: list selection methodListMenu: methodListKey:from:) (0 0 1 0.4) (0 0 0 0))
		((textMorph: text) (0 0.4 1 1))
		) ].

	^ #(
		((listMorph:selection:menu:keystroke: list selection methodListMenu: methodListKey:from:) (0 0 1 0.4) (0 0 0 0))
		((textMorph: annotations) (0 0.4 1 0.4) (0 0 0 defaultAnnotationPaneHeight))
		((textMorph: text) (0 0.4 1 1) (0 defaultAnnotationPaneHeight 0 0))
	)