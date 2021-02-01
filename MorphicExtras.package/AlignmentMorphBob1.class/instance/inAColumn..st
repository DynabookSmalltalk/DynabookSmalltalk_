ui construction
inAColumn: aCollectionOfMorphs

	| col |
	col := AlignmentMorph newColumn
		color: Color transparent;
		vResizing: #shrinkWrap;
		layoutInset: 1;
		wrapCentering: #center;
		cellPositioning: #topCenter.
	aCollectionOfMorphs do: [ :each | col addMorphBack: each].
	^col