dropping/grabbing
aboutToBeGrabbedBy: aHand

	| aFridge |
	super aboutToBeGrabbedBy: aHand.
	aFridge := self ownerThatIsA: NebraskaFridgeMorph.
	aFridge ifNil: [^self].
	aFridge noteRemovalOf: self.