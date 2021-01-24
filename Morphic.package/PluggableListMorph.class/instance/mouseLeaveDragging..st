events
mouseLeaveDragging: anEvent

	self hoverRow: nil.
	anEvent hand releaseMouseFocus: self.
	(self dropEnabled and:[anEvent hand hasSubmorphs]) ifFalse: ["no d&d"
		^ super mouseLeaveDragging: anEvent].
	self resetPotentialDropRow.
	"above is ugly but necessary for now"
