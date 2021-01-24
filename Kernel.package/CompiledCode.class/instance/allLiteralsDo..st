literals
allLiteralsDo: aBlock
	"Enumerate all literals thoroughly. Follow nested instances of CompiledCode. Do not treat compiled code as literals here."
	
	self codeLiteralsDo: [:compiledCode | compiledCode literalsDo: [:literal |
		literal isCompiledCode ifFalse: [literal allLiteralsDo: aBlock] ]].

	"Enumerate special selectors."
	self flag: #todo.
	
	"Enumerate special literals such as true and false."
	self flag: #todo.