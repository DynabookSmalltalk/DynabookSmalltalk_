testing
isUnchangedMethod
	"true if this is a modification of a method where only the timestamp changed"
	^ obsoletion isMethodDefinition
		and: [obsoletion source = modification source
			and: [obsoletion category = modification category] ]