accessing - padding
verticalPadding

	self verticalAlignmentMorph = #top 		ifTrue: [^ self padding top].
	self verticalAlignmentMorph = #bottom 	ifTrue: [^ self padding bottom].
	^ 0