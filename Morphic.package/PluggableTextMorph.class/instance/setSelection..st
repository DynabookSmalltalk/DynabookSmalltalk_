model access
setSelection: anInterval
	"Sets a new selection of characters. If the argument is nil, give the model a chance to just leave the selection where it currently is."
	
	(anInterval notNil and: [anInterval ~= selectionInterval]) ifTrue: [
		
		"Note old selection."
		textMorph selectionChanged.
		
		"Update selection."
		selectionInterval := anInterval.
		textMorph editor selectFrom: anInterval first to: anInterval last.

		"Note new selection."	
		textMorph selectionChanged].

	"Even if there is no change, ensure that the selection is visible."
	self scrollSelectionIntoView.