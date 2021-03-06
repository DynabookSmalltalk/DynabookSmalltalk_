preferences
themeProperties

	^ super themeProperties, {
		{ #font. 'Fonts'. 'Font of the list items.' }.
		{ #textColor. 'Colors'. 'Color of the list items.' }.
		{ #selectionColor. 'Colors'. 'Color used for items when hovering or selecting them.' }.
		{ #selectionTextColor. 'Colors'. 'Color used for label when hovering or selecting them.' }.
		
		{ #filterColor. 'Colors'. 'Color used for items to indicate the matching filter.' }.
		{ #filterTextColor. 'Colors'. 'Color used for items to indicate the matching filter.' }.
		{ #highlightTextColor. 'Colors'. 'Color used for highlighted items.' }.
		
		{ #hoverSelectionModifier. 'Colors'. 'How to derive the hover color from the selection color.'}.

		{ #lineColor. 'Colors'. 'How the lines are drawn.' }.
	}