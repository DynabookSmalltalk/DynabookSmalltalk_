private - initialization
newAColorMorph
	"Answer a new alpha color morph."

	^AColorSelectorMorph new
		model: self;
		hResizing: #spaceFill;
		vResizing: #rigid;
		setValueSelector: #alphaSelected:;
		extent: 50@24