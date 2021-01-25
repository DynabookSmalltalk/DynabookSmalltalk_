rules-basic
seq

	| xs |
	xs := self apply: #anything.
	xs do: [:x |
		" may want to inline #apply:withArgs: below as an
		  optimization, since this rule gets used a lot "
		self apply: #exactly withArgs: {x}
	].
	^ xs
	