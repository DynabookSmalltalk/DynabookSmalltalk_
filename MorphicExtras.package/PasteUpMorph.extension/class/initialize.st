*MorphicExtras-class initialization
initialize
	"Initialize the class"

	#('keyStroke') translatedNoop.

	self registerInFlapsRegistry.	
	ScriptingSystem addCustomEventFor: self named: #keyStroke help: 'when a keystroke happens and nobody heard it' translatedNoop targetMorphClass: PasteUpMorph.