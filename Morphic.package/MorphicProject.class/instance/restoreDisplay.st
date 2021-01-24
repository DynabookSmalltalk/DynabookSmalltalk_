scheduling & debugging
restoreDisplay
	"Give all morphs a chance to draw again."
	self world ifNotNil: [:w | w allMorphsDo: [:ea | ea removeProperty: #errorOnDraw ]].

	super restoreDisplay.