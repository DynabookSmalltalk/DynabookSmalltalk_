menu
lineAlignmentIsCenterString

	^ (self verticalAlignmentLine = #center 
			ifTrue: ['<on>']
			ifFalse: ['<off>']) 
		, 'center' translated