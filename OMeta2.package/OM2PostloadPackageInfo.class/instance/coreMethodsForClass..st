testing
coreMethodsForClass: aClass
	MCMethodDefinition shutDown.	"flush cache so pre- and postload don't interfere"
	^(super coreMethodsForClass: aClass) select: [:each | OMeta2RuleParser isOMeta2Rule: each source]