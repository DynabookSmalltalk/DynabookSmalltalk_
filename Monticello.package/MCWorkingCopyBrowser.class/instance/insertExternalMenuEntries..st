morphic ui
insertExternalMenuEntries: aMenu
	
	self class externalMenuEntries ifNotEmpty: [
		aMenu addLine.
		self class externalMenuEntries do: [:each |
			aMenu 
				add: each entry 
				target: each target
				selector: each selector
				argument: self]].