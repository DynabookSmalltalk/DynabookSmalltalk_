ui
showMenuOf: selectorCollection withFirstItem: firstItem ifChosenDo: choiceBlock
	"Show a sorted menu of the given selectors, preceded by firstItem, and all
	abbreviated to 40 characters.  Evaluate choiceBlock if a message is chosen."

	^ self showMenuOf: selectorCollection withFirstItem: firstItem ifChosenDo: choiceBlock withCaption: nil