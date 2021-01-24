A ParseNodeWithPrecedingStatementEnumerator is a ParseNodeEnumerator that accepts a binary block in ofBlock:, and hence enumerates statement nodes with their preceding statement, or nil if they are the first.

Instance Variables
	precedingStatement:		<ParseNode | nil>

precedingStatement
	- the preceding statement node, if any
