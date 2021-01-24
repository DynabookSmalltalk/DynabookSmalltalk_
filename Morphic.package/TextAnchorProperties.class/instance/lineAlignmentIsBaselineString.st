menu
lineAlignmentIsBaselineString

	^ (self verticalAlignmentLine = #baseline 
			ifTrue: ['<on>']
			ifFalse: ['<off>']) 
		, 'baseline' translated