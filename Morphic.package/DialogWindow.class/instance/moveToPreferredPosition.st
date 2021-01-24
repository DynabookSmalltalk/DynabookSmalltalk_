initialization
moveToPreferredPosition
	self center:
		(preferredPosition isPoint
			ifTrue: [ preferredPosition ]
			ifFalse: [ self center + self currentHand position - preferredPosition center ]).
	self bounds: (self bounds translatedToBeWithin: self currentWorld bounds)