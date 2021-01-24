*Monticello-testing
isForPackageLoad
	| packageName |
	^(name includes: $-)
	  and: [name last isDigit
	  and: [packageName := name first: ((name indexOf: $. ifAbsent: [name size])
											min: (name lastIndexOf: $-)) - 1.
		MCWorkingCopy allManagers anySatisfy: [:wc| wc packageName = packageName]]]