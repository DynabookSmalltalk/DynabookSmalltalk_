like fullCopy
initialize: size

	references := IdentityDictionary new: size.
	uniClasses := IdentityDictionary new.	"UniClass -> new UniClass"
	"self isItTimeToCheckVariables ifTrue: [self checkVariables]."
		"no more checking at runtime"
	newUniClasses := true.