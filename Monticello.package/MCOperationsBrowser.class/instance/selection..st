selecting
selection: aNumber 
	selection := self items
		at: aNumber
		ifAbsent: [  ].
	self
		 changed: #selection ;
		 changed: #text ;
		 changed: #annotations