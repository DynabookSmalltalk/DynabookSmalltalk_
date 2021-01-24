debug and other
browseImplementationOfGetListSelector

	| method |
	method := model class lookupSelector: getListSelector.
	ToolSet browse: method methodClass selector: method selector.