tabs
highlightOnlySubmorph: aMorph in: anotherMorph
	"Distinguish only aMorph with border highlighting (2-pixel wide red); make all my other submorphs have one-pixel-black highlighting.  This is a rather special-purpose and hard-coded highlighting regime, of course.  Later, if someone cared to do it, we could parameterize the widths and colors via properties, or some such."

	anotherMorph submorphs do: [:m | | color |
	 	color := m == aMorph ifTrue: [self buttonActiveColor] ifFalse: [self buttonColor].
		m 
			borderWidth: 1;
			borderColor: color. 
		m firstSubmorph color: color]
