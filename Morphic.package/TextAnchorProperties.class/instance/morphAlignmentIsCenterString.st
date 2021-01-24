menu
morphAlignmentIsCenterString

	^ (self verticalAlignmentMorph = #center 
			ifTrue: ['<on>']
			ifFalse: ['<off>']) 
		, 'center' translated