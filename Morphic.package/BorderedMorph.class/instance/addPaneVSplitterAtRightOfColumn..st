resize handling
addPaneVSplitterAtRightOfColumn: someMorphs

	| targetX minY maxY splitter |
	targetX := someMorphs first layoutFrame rightFraction.
	
	minY := (someMorphs detectMin: [:each | each layoutFrame topFraction]) layoutFrame topFraction.
	maxY := (someMorphs detectMax: [:each | each layoutFrame bottomFraction]) layoutFrame bottomFraction.
	
	splitter := ProportionalSplitterMorph new beSplitsLeftAndRight; yourself.
	splitter layoutFrame: (LayoutFrame
		fractions: (targetX @ minY corner: targetX @ maxY)
		offsets: (0 @ (someMorphs first layoutFrame topOffset ifNil: [0])
			corner: (AbstractResizerMorph gripThickness@ (someMorphs first layoutFrame bottomOffset ifNil: [0])))).

	self addMorphBack: (splitter position: self position).