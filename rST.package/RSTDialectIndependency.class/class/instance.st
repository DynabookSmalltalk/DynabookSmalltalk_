instance creation
instance
	^ instance
		ifNil: [instance _ RSTDialectIndependencySqueak new initialize]