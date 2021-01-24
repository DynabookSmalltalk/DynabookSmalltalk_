change reporting
addedMorph: aMorph
	"Update the new morph's layout properties according to my orientation."

	aMorph isMenuItemMorph ifFalse: [^ self].
	
	self isVertical
		ifTrue: [
			aMorph hResizing: #spaceFill.
			aMorph vResizing: #shrinkWrap ]
		ifFalse: [
			aMorph hResizing: #shrinkWrap.
			aMorph vResizing: #spaceFill ].