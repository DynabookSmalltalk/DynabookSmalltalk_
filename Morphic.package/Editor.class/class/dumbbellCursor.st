preferences
dumbbellCursor
	<preference: 'Dumbbell Text Cursor'
		category: 'Morphic'
		description: 'When enabled, the text cursor assumes the shape of a dumbbell, otherwise a vertical bar.'
		type: #Boolean>
	^ DumbbellCursor ifNil: [ false ]