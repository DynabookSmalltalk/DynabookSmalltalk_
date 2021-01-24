printing
defaultLabelForInspector
	"Answer the default label to be used for an Inspector window on the receiver."

	^ super defaultLabelForInspector, ': ', ([self printStringLimitedTo: 100]
		ifError: ['<error cannot print this number>'])