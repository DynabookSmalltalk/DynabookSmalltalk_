preferences
flashOnErrors

	<preference: 'Flash on Errors in Lists'
		category: #Morphic
		description: 'If a user request cannot be fulfilled as expected, flash briefly to inform the user about it. While this can improve user feedback, it adds a small delay because of an explicit world refresh.'
		type: #Boolean>
		
	^ FlashOnErrors ifNil: [false]