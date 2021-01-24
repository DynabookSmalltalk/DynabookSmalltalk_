ui
widgetSpecs
	Preferences annotationPanes ifFalse: [ ^#(
		((buttonRow) (0 0 1 0) (0 0 0 defaultButtonPaneHeight))
		((listMorph:selection:menu:keystroke: list selection methodListMenu: methodListKey:from:) (0 0 1 0.4) (0 defaultButtonPaneHeight 0 0))
		((innerButtonRow) (0 0.4 1 0.4) (0 0 0 defaultButtonPaneHeight))
		((textMorph: text) (0 0.4 1 1) (0 defaultButtonPaneHeight 0 0))
		)].

	^ {
		#((buttonRow) (0 0 1 0) (0 0 0 defaultButtonPaneHeight)).
		#((listMorph:selection:menu:keystroke: list selection methodListMenu: methodListKey:from:) (0 0 1 0.4) (0 defaultButtonPaneHeight 0 0)).
		#((innerButtonRow) (0 0.4 1 0.4) (0 0 0 defaultButtonPaneHeight)).
		{ #(textMorph: annotations). #(0 0.4 1 0.4). { 0. self defaultButtonPaneHeight. 0. self defaultButtonPaneHeight+self defaultAnnotationPaneHeight. }}.
		{ #(textMorph: text). #(0 0.4 1 1). { 0. self defaultButtonPaneHeight+self defaultAnnotationPaneHeight. 0. 0.}}
	}