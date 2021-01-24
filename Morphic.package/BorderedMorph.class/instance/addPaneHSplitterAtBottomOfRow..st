resize handling
addPaneHSplitterAtBottomOfRow: someMorphs

	| targetY minX maxX splitter |
	targetY := someMorphs first layoutFrame bottomFraction.

	minX := (someMorphs detectMin: [:each | each layoutFrame leftFraction]) layoutFrame leftFraction.
	maxX := (someMorphs detectMax: [:each | each layoutFrame rightFraction]) layoutFrame rightFraction.

	splitter := ProportionalSplitterMorph new beSplitsTopAndBottom; yourself.
	splitter layoutFrame: (LayoutFrame
		fractions: (minX @ targetY corner: maxX @ targetY)
		offsets: ((someMorphs first layoutFrame leftOffset ifNil: [0]) @ 0 
			corner: (someMorphs first layoutFrame rightOffset ifNil: [0]) @ AbstractResizerMorph gripThickness)).

	self addMorphBack: (splitter position: self position).