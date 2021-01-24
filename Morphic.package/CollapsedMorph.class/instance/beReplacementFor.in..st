collapse/expand
beReplacementFor: aMorph in: anOwner
	"Encapsulate aMorph with the CollapsedMorph and display the latter in anOwner"

	| priorPosition |
	uncollapsedMorph := aMorph.
	
	self setLabel: aMorph externalName.
	aMorph delete.
	self privateOwner: anOwner. "lest RealEstateAgent fail at positioning me"
	self collapseOrExpand.
	anOwner addMorphFront: self.
	(priorPosition := aMorph valueOfProperty: #collapsedPosition ifAbsent: [nil])
		ifNotNil: [self position: priorPosition].