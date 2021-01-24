accessing
reparent
	(self confirm:'Adopt ',self version info name, ' as the sole ancestor of your working copy?')
		ifTrue: [
			self version reparent.
			self refresh]