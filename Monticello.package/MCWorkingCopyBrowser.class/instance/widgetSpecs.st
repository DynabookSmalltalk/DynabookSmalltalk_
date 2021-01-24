morphic ui
widgetSpecs
	^ #(
		((buttonRow) (0 0 1 0) (0 0 0 defaultButtonPaneHeight))
		((treeOrListMorph: workingCopy) (0 0 0.5 1) (0 defaultButtonPaneHeight 0 0))
		((listMorph: repository) (0.5 0 1 1) (0 defaultButtonPaneHeight 0 0))
		)