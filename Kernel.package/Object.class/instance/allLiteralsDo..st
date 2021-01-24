literals
allLiteralsDo: aBlock

	self flag: #discuss. "mt: Better implement this only on Symbol, Array, Number, Binding, etc. instead of Object?"
	aBlock value: self.