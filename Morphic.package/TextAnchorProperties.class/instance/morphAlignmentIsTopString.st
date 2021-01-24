menu
morphAlignmentIsTopString

	^ (self verticalAlignmentMorph = #top 
			ifTrue: ['<on>']
			ifFalse: ['<off>']) 
		, 'top' translated