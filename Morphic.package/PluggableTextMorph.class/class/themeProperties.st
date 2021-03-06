preferences
themeProperties

	^ super themeProperties, {
		{ #font. 'Fonts'. 'Font for text if not styled.' }.
		{ #textColor. 'Colors'. 'Color for text if not styled.' }.		
		{ #caretColor. 'Colors'. 'The color of the text cursor.' }.
		{ #selectionColor. 'Colors'. 'The color of the text selection.' }.
		{ #unfocusedSelectionModifier. 'Colors'. 'How to derive the text selection color if not focused.' }.
		
		{ #adornmentReadOnly. 'Color'. 'How to indicate read-only contents.' }.
		{ #adornmentRefuse. 'Color'. 'How to indicate that the model refuses to accept.' }.
		{ #adornmentConflict. 'Color'. 'How to indicate that there are editing conflicts.' }.
		{ #adornmentDiff. 'Color'. 'How to indicate that the model wants diff feedback.' }.
		{ #adornmentNormalEdit. 'Color'. 'How to indicate that there are unaccepted edits.' }.
		{ #adornmentDiffEdit. 'Color'. 'How to indicate that there are unaccepted edits in a diff view.' }.
		
		{ #wrapBorderColorModifier. 'Color'. 'How to indicate a specific wrap border.' }.
		{ #frameAdornmentWidth. 'Geometry'. 'Width of simple frame adornments.' }.
	}