submorphs-add/remove
addMorphFront: aMorph fromWorldPosition: wp 
	"Overridden for more specific re-layout and positioning"
	aMorph textAnchorProperties anchorLayout == #document 
		ifFalse:[^ self 
					anchorMorph: aMorph 
					at: wp 
					type: aMorph textAnchorProperties anchorLayout].
	self addMorphFront: aMorph.
