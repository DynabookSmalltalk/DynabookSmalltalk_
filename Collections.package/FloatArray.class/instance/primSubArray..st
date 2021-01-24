primitives-plugin
primSubArray: floatArray

	<primitive: 'primitiveSubFloatArray' module: 'FloatArrayPlugin'>
	self isOfSameSizeCheck: floatArray.
	1 to: self size do:[:i| self at: i put: (self at: i) - (floatArray at: i)].