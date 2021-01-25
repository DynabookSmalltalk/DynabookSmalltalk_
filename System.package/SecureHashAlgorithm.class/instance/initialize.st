initialize-release
initialize

	self primHasSecureHashPrimitive
		ifTrue: [ totals := Bitmap new: 5 ]
		ifFalse: [
			totalA := ThirtyTwoBitRegister new.
			totalB := ThirtyTwoBitRegister new.
			totalC := ThirtyTwoBitRegister new.
			totalD := ThirtyTwoBitRegister new.
			totalE := ThirtyTwoBitRegister new ]