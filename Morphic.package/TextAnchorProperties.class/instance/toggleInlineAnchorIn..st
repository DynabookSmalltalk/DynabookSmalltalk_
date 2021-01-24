menu
toggleInlineAnchorIn: aMorph
	"Change the anchor from/to line anchoring"

	| newType |
	newType := self anchorLayout == #inline 
		ifTrue: [#document]
		ifFalse: [#inline]. 
	self anchorLayout: newType.
	self updateOwnerOf: aMorph.