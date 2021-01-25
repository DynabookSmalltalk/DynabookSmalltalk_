initialization
initialize
	super initialize.
	backgroundForm := (
		(StringMorph contents: '......' font: (TextStyle default fontOfSize: 24))
			color: Color white
	) imageForm.
	bounds := backgroundForm boundingBox.
