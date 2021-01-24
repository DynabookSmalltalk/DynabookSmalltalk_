menu
morphAlignmentIsBottomString

	^ (self verticalAlignmentMorph = #bottom 
			ifTrue: ['<on>']
			ifFalse: ['<off>']) 
		, 'bottom' translated