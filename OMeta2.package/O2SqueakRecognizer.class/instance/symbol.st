rules-parsing
symbol =

	"#" spaces
		(	tsString
		|	tsKeyword (tsIdentifier | empty)
		)