comparing
hasSameLiteralsAs: aMethod
	"Answer whether the receiver has the same sequence of literals as the argument.
	 Compare the last literal, which is the class association, specially so as not to
	 differentiate between otherwise identical methods installed in different classes.
	 Compare the first literal carefully if it is the binding informaiton for an FFI or
	 external primitive call.  Don't compare all of the state so that linked and unlinked
	 methods are still considered equal."
	| numLits |
	numLits := self numLiterals.
	numLits = aMethod numLiterals ifFalse: [^false].
	1 to: numLits do:
		[:i| | lit1 lit2 |
		lit1 := self literalAt: i.
		lit2 := aMethod literalAt: i.
		(lit1 == lit2 or: [lit1 literalEqual: lit2]) ifFalse:
			[(i = 1 and: [#(117 120) includes: self primitive])
				ifTrue:
					[lit1 isArray
						ifTrue:
							[(lit2 isArray and: [(lit1 first: 2) = (lit2 first: 2)]) ifFalse:
								[^false]]
						ifFalse: "ExternalLibraryFunction"
							[(lit1 analogousCodeTo: lit2) ifFalse:
								[^false]]]
				ifFalse:
					[i = (numLits - 1)
						ifTrue: "properties"
							[(self properties analogousCodeTo: aMethod properties)
								ifFalse: [^false]]
						ifFalse: "last literal (methodClassAssociation) of class-side methods is not unique"
								"last literal of CompiledBlock is outerMethod and may not be unique."
							[(self isCompiledBlock
							  and: [lit1 isCompiledCode
							  and: [lit2 isCompiledCode]]) ifTrue:
								[^true].
							(i = numLits
							 and: [lit1 isVariableBinding and: [lit1 value isBehavior
							 and: [lit2 isVariableBinding and: [lit2 value isBehavior]]]]) ifFalse:
								[^false]]]]].
	^true