menu
morphAlignmentIsBaselineString

	^ (self verticalAlignmentMorph = #baseline 
			ifTrue: ['<on>']
			ifFalse: ['<off>']) 
		, 'baseline' translated