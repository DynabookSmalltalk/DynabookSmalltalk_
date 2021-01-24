comparing
= anObject
	^self class == anObject class
	  and: [selector == anObject selector "selector lookup is by identity"
	  and: [lookupClass == anObject lookupClass
	  and: [args literalEqual: anObject arguments]]]