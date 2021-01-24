menu
lineAlignmentIsBottomString

	^ (self verticalAlignmentLine = #bottom 
			ifTrue: ['<on>']
			ifFalse: ['<off>']) 
		, 'bottom' translated