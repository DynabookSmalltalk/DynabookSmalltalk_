initialization
initializeFor: aSketchMorph inBounds: boundsToUse pasteUpMorph: aPasteUpMorph
	"Initialize the receiver to edit the given sketchMorph in the given bounds, with the resulting object to reside in the given pasteUpMorph."

	| paintBoxBounds worldBounds |
	self world paintingFlapTab ifNotNil: [:tab |
		tab showFlap.
		^ self
			initializeFor: aSketchMorph
			inBounds: boundsToUse
			pasteUpMorph: aPasteUpMorph
			paintBoxPosition: nil].

	self setProperty: #recipientPasteUp toValue: aPasteUpMorph.

	paintBoxBounds := self world paintBox bounds.
	worldBounds := self world bounds.

	aPasteUpMorph standardPalette ifNotNil: [:palette | palette showNoPalette].

	self initializeFor: aSketchMorph inBounds: boundsToUse 
		pasteUpMorph: aPasteUpMorph 
		paintBoxPosition: ((boundsToUse topRight extent: paintBoxBounds extent)
			translatedToBeWithin: worldBounds) topLeft.
