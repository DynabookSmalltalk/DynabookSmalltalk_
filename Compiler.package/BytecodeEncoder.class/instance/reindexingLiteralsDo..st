code generation
reindexingLiteralsDo: aBlock
	"Reset any and all literals so that they will be given new indices in
	 the literalStream during aBlock (which will be used to generate a
	 nested block method).  Afterwards restore those same literals to
	 their original state, and reset any and all new literals added during
	 aBlock  so that they will be given new indices if used subsequently."
	| savedNodes saveBlock |
	savedNodes := IdentityDictionary new.
	saveBlock := [:node|
					savedNodes at: node put: node shallowCopy.
					node resetForBlockGeneration].
	litSet do: saveBlock.
	litIndSet do: saveBlock.
	selectorSet do: saveBlock.
	^aBlock ensure:
		[| restoreBlock |
		 restoreBlock := [:node|
							savedNodes
								at: node
								ifPresent: [:copy| node resetFromCopy: copy]
								ifAbsent: [node resetForBlockGeneration]].
		 litSet do: restoreBlock.
		 litIndSet do: restoreBlock.
		 selectorSet do: restoreBlock]