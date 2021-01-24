geometry
extent: newExtent

	self renderedMorph == self
		ifTrue: [super extent: newExtent]
		ifFalse: [
			self adjustAfter: [
				| scaleFactor |
				scaleFactor := (self scale * newExtent r / self fullBounds extent r) max: 0.1.
				self scale: (scaleFactor detentBy: 0.1 atMultiplesOf: 1.0 snap: false)]].