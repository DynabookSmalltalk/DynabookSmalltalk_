debug menu
browseImplementationOfActionSelector

	| method |
	method := model class lookupSelector: actionSelector.
	ToolSet browse: method methodClass selector: method selector.