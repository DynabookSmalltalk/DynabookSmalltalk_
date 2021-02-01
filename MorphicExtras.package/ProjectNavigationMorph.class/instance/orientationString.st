private - ui
orientationString
	^ (self orientedVertically
		ifTrue: ['<yes>']
		ifFalse: ['<no>'])
		, 'vertical orientation' translated