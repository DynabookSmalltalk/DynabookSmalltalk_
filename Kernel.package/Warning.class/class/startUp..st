class initialization
startUp: resuming

	resuming ifTrue: [
		self withAllSubclassesDo: [:warningClass |
			warningClass resetOnStartUp ifTrue: [warningClass resetWarnings]]].