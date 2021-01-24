rotate scale and flex
addFlexShell
	"Wrap a rotating and scaling shell around this morph."

	| oldHalo myWorld flexMorph anIndex |
	oldHalo:= self halo.
	myWorld := self world.
	self owner
		ifNil: [flexMorph := self newTransformationMorph asFlexOf: self]
		ifNotNil: [:myOwner |
			anIndex := myOwner submorphIndexOf: self.
			"Avoid triggering outOfWorld: on self by first adding flexMorph to myOwner and only then making myself a submorph of flexMorph via asFlexOf:"
			flexMorph := self newTransformationMorph.
			myOwner addMorph: flexMorph asElementNumber: anIndex.
			flexMorph asFlexOf: self.
			myWorld ifNotNil: [myWorld startSteppingSubmorphsOf: flexMorph]].
	self transferStateToRenderer: flexMorph.
	oldHalo ifNotNil: [oldHalo setTarget: flexMorph].

	^ flexMorph