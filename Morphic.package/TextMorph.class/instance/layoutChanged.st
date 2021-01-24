layout
layoutChanged
	"For embedded morphs, we have to invalidate our paragraph if those morphs invalidate their layout. Since paragraph creation will also change this morph's bounds, ignore that case."

	"2019-10-16 mt Does not work. Breaks up scroll ranges after saving a method. Breaks highlight of opening parenthesis in Shout."
	"(self hasProperty: #CreatingParagraph) ifFalse: [self releaseParagraph]."

	^ super layoutChanged