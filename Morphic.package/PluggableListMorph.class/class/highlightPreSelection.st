preferences
highlightPreSelection

	<preference: 'Highlight Pre-Selection in Lists'
		category: #Morphic
		description: 'Indicate the attempt to change the selection in models like after a click or key press. If model updates can take long, such indication can improve user feedback. However, this adds a small delay because of an explicit world refresh.'
		type: #Boolean>
		
	^ HighlightPreSelection ifNil: [false]