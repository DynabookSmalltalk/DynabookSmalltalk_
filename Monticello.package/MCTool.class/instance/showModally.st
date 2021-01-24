morphic ui
showModally
	modalProcess := Processor activeProcess.
	self window openInWorldExtent: self defaultExtent.
	[self window world notNil] whileTrue: [
		self window outermostWorldMorph doOneCycle.
	].
	morph := nil.
	^ modalValue