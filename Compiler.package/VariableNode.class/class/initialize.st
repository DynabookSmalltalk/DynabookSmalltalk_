class initialization
initialize    "VariableNode initialize"
	| encoder |
	encoder := Encoder new.
	StdVariables := Dictionary new: 16.
	encoder
		fillDict: StdVariables
		with: VariableNode
		mapping: #('self' 'thisContext' 'super' 'nil' 'false' 'true' )
		to: (Array with: LdSelf with: LdThisContext with: LdSuper)
				, (Array with: LdNil with: LdFalse with: LdTrue).
	StdSelectors := Dictionary new: 64.
	encoder
		fillDict: StdSelectors
		with: SpecialSelectorNode
		mapping: ((1 to: Smalltalk specialSelectorSize) collect: 
							[:i | Smalltalk specialSelectorAt: i])
		to: (1 to: Smalltalk specialSelectorSize) asArray.
	StdLiterals := PluggableDictionary new equalBlock: #literalEqual:. "This is at least as fast as a block and eliminates a recompileAll dependency. eem 10/8/2019"
	encoder
		fillDict: StdLiterals
		with: LiteralNode
		mapping: #(-1 0 1 2 )
		to: (LdMinus1 to: LdMinus1 + 3).
	encoder initScopeAndLiteralTables.

	NodeNil := encoder encodeVariable: 'nil'.
	NodeTrue := encoder encodeVariable: 'true'.
	NodeFalse := encoder encodeVariable: 'false'.
	NodeSelf := encoder encodeVariable: 'self'.
	NodeThisContext := encoder encodeVariable: 'thisContext'.
	NodeSuper := encoder encodeVariable: 'super'