menu commands
printIt
	| oldEditor |
	textMorph editor selectFrom: selectionInterval first to: selectionInterval last;
						model: model.  "For, eg, evaluateSelection"
	textMorph handleEdit: [(oldEditor := textMorph editor) evaluateSelectionAndDo:
		[:result |
		self flag: #fixIntervalCache. "mt: We should find a better design for discarding unused text editors in text morphs and restoring them on demand."
		selectionInterval := oldEditor markIndex to: oldEditor pointIndex -1.
		textMorph installEditorToReplace: oldEditor.
		textMorph handleEdit: [oldEditor afterSelectionInsertAndSelect: result printString].
		selectionInterval := oldEditor markIndex to: oldEditor pointIndex -1.
	
		textMorph editor selectFrom: selectionInterval first to: selectionInterval last.
		self scrollSelectionIntoView]]