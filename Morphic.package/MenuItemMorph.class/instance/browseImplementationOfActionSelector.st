browse
browseImplementationOfActionSelector

	| method |
	method := target class lookupSelector: selector.
	ToolSet browse: method methodClass selector: method selector.