file list services
serviceImageAsBackground
	"Answer a service for setting the desktop background from a given graphical file's contents"

	^ SimpleServiceEntry 
		provider: self 
		label: 'use graphic as background' translatedNoop
		selector: #openAsBackground:
		description: 'use the graphic as the background for the desktop' translatedNoop
		buttonLabel: 'background' translatedNoop