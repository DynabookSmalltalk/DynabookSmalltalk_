preferences
themeProperties

	^ super themeProperties, {
		{ #borderColor. 'Colors'. 'Color of the dialogs''s border.' }.
		{ #borderWidth. 'Borders'. 'Width of the dialogs''s border.' }.
		{ #borderStyle. 'Borders'. 'Whether to use a plain border, inset, or outset.' }.
		{ #color. 'Colors'. 'Background color of the dialog.' }.
		{ #font. 'Fonts'. 'Font for dialog messages.' }.
		{ #textColor. 'Colors'. 'Color for dialog messages.' }.
		
		{ #titleBorderColor. 'Colors'. 'Color of the dialogs title border.' }.
		{ #titleBorderWidth. 'Geometry'. 'Width of the dialog title border.' }.
		{ #titleBorderStyle. 'Borders'. 'Whether to use a plain border, inset, or outset for the title.' }.
		{ #titleColor. 'Colors'. 'Background color of the dialogs'' title.' }.
		{ #titleFont. 'Fonts'. 'Font for dialog title.' }.
		{ #titleTextColor. 'Colors'. 'Color for the dialog title label.' }.
		
		{ #okColor. 'Colors'. 'Color for the OK button.' }.
		{ #cancelColor. 'Colors'. 'Color for the Cancel button.' }.
		{ #buttonColor. 'Colors'. 'Color for a normal button.' }.
		{ #selectionModifier. 'Colors'. 'How to convert the color of a selected button?' }.
	}