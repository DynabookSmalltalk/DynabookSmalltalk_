vm statistics
formatVMParameter: aNumber
	"Format a VM parameter that may have been reported either as a Float or
	an Integer. If a VM parameter is defined in units of milliseconds but internally
	measured to microsecond precision by the VM, the VM may choose to return
	the value as a Float in order to retain full precision. Otther representations
	such as Fraction may seem more natural but are difficult to instantiate in
	the VM, hence the presumption of Float for representation of higher precision
	millisecond values."

	^ aNumber isFloat
		ifTrue: [ aNumber < 1000
			ifTrue: [ aNumber printShowingMaxDecimalPlaces: 5 ]
			ifFalse: [ aNumber rounded asStringWithCommas ] ]
		ifFalse: [ aNumber asInteger asStringWithCommas ].