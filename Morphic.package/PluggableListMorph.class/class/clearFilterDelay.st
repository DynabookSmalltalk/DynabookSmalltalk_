preferences
clearFilterDelay
	<preference: 'Filterable Lists Clear Delay'
		category: 'scrolling'
		description: 'Defines the maximum delay (in milliseconds) between keystrokes before the filter expression is cleared again.'
		type: #Number>
		
	^ ClearFilterDelay ifNil: [500]