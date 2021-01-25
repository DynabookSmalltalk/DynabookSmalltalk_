listing
referenceForMethod: aSymbol ofClass: aClass
	MCMethodDefinition shutDown.	"flush cache so pre- and postload don't interfere"
	^((OMeta2RuleParser isOMeta2Rule: (aClass sourceCodeAt: aSymbol))
		ifTrue: [OM2DecompilingMethodReference]
		ifFalse: [MethodReference]) new setStandardClass: aClass methodSymbol: aSymbol