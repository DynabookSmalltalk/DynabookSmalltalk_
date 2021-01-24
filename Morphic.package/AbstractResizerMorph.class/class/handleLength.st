preferences
handleLength

	<preference: 'Handle Length'
		category: 'windows'
		description: 'AThe size of a grip handle if shown. Can be interpreted as width or height, depending of the resizer orientation. Does not affect the clickable area. See grip thickness for that.'
		type: #Number>
			
	^ HandleLength ifNil: [25]