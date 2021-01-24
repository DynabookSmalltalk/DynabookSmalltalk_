menu
lineAlignmentIsTopString

	^ (self verticalAlignmentLine = #top 
			ifTrue: ['<on>']
			ifFalse: ['<off>']) 
		, 'top' translated