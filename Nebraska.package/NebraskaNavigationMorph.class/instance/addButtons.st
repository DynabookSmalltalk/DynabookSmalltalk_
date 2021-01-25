as yet unclassified
addButtons

	self addARow: {
		self inAColumn: {self buttonScale}.
		self inAColumn: {self buttonQuit}.
		self inAColumn: {self buttonBuffered}.
	}.
