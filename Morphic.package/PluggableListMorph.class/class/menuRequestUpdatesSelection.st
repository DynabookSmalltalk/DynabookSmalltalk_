preferences
menuRequestUpdatesSelection

	<preference: 'Menu request updates list/tree selection'
		category: #Morphic
		description: 'When invoking a menu, the action is applied to the current selection in the list. If the mouse cursor it at a different location, however, this preference will update the selection before showing the menu if enabled.'
		type: #Boolean>
	^ MenuRequestUpdatesSelection ifNil: [ false ]