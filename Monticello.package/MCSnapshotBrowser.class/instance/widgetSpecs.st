morphic ui
widgetSpecs

	Preferences annotationPanes ifFalse: [ ^#(
		((listMorph: category) (0 0 0.25 0.4))
		((listMorph: class) (0.25 0 0.50 0.4) (0 0 0 -30))
		((listMorph: protocol) (0.50 0 0.75 0.4))
		((listMorph:selection:menu:keystroke:  methodList methodSelection methodListMenu: methodListKey:from:) (0.75 0 1 0.4))
		((buttonRow) (0.25 0.4 0.5 0.4) (0 -30 0 0))
		((codePane: text) (0 0.4 1 1))
		) ].

	^#(
		((listMorph: category) (0 0 0.25 0.4))
		((listMorph: class) (0.25 0 0.50 0.4) (0 0 0 -30))
		((listMorph: protocol) (0.50 0 0.75 0.4))
		((listMorph:selection:menu:keystroke:  methodList methodSelection methodListMenu: methodListKey:from:) (0.75 0 1 0.4))

		((buttonRow) (0.25 0.4 0.5 0.4) (0 -30 0 0))

		((inputMorph: annotations) (0 0.4 1 0.4) (0 0 0 defaultInputFieldHeight))
		((codePane: text) (0 0.4 1 1) (0 defaultInputFieldHeight 0 0))
		)