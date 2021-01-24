private
typeOfSubclass: aSymbol
	#(
		(subclass: normal)
		(variableSubclass: variable)
		(variableByteSubclass: bytes)
		(variableDoubleByteSubclass: shorts)
		(variableWordSubclass: words)
		(variableDoubleWordSubclass: longs)
		(weakSubclass: weak)
		(ephemeronSubclass: ephemeron)
		(immediateSubclass: immediate)
		) do: [:ea | ea first = aSymbol ifTrue: [^ ea second]].
	self error: 'Unrecognized class definition'