preferences
themeProperties

	^ super themeProperties, {
		{ #borderColor. 'Colors'. 'Color of the tools'' border.' }.
		{ #borderWidth. 'Borders'. 'Width of the tools'' border.' }.
		{ #borderStyle. 'Borders'. 'Whether to use a plain border, inset, or outset.' }.
		{ #color. 'Colors'. 'Background color of the tool.' }.
		{ #textColor. 'Colors'. 'Color for the category button labels.' }.
		{ #selectionTextColor. 'Colors'. 'Color used for the button of the selected category.' }.
	}