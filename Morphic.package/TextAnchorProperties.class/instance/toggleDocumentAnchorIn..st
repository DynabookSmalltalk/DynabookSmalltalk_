menu
toggleDocumentAnchorIn: aMorph
	"Change the anchor from/to document anchoring"

	| newType |
	newType := self anchorLayout == #document 
		ifTrue: [#inline]
		ifFalse: [ #document].
	self anchorLayout: newType.
	self updateOwnerOf: aMorph.
	