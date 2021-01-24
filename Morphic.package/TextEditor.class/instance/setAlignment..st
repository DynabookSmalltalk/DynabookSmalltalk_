menu messages
setAlignment: selectionString
	| attr interval  |
	attr := selectionString
		caseOf: 
			{ [ 'indented' ] -> [ TextIndent amount: 1 ].
			[ 'indented more' ] -> [ TextIndent amount: self existingIndentation+1 ].
			[ 'indented less' ] -> [  TextIndent amount: (self existingIndentation-1 max: 0) ]}
		otherwise:
			[ TextAlignment perform: selectionString asSymbol ].
	interval := self encompassLine: self selectionInterval.
	paragraph
		replaceFrom: interval first 
		to: interval last 
		with: ((paragraph text copyFrom: interval first to: interval last) addAttribute: attr)