accessing
creationTemplate
	^ super creationTemplate
		ifNil:
			[ self creationTemplate: (self class creationTemplateLocation: self directory pathName).
			creationTemplate ]