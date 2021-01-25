private
strongDependents
	^ strongDependents
		ifNil: [strongDependents _ IdentitySet new]