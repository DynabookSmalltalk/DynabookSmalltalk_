tools
allThemeProperties
	"Answer an Array of 3-element Arrays.  Each inner Array holds the information needed to present a theme editor tool; the property name, category, and description."

	"self allThemeProperties"

	^ Array streamContents: [:stream |
		self allThemePropertiesDo: [:cls :prop |
			stream nextPut: {cls}, prop]]