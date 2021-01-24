accessing
verticalAlignment: symbolOrTuple
	"This method accepts tuples in which the first element designates 
	which part of the morph is aligned to which part of the text line which 
	the second element designates.

	morph baseline allows for the morph to set its own baseline (see morphBaselineGetter:)"
	symbolOrTuple isSymbol
		ifTrue:
			[ self 
				verticalAlignmentMorph: symbolOrTuple; 
				verticalAlignmentLine: symbolOrTuple ]
		ifFalse: 
			[  self 
				verticalAlignmentMorph: symbolOrTuple first ;
				verticalAlignmentLine: symbolOrTuple second ]