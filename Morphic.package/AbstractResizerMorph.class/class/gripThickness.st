preferences
gripThickness
	"A number in pixels that encodes the area were the user can target splitters or edge grips."

	<preference: 'Grip Thickness'
		category: 'windows'
		description: 'A number in pixels that encodes the area were the user can target splitters or edge grips such as in application windows. Bigger grips make it easier to click on them.'
		type: #Number>
		
	^ GripThickness ifNil: [4]