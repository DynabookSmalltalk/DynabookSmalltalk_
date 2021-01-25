as yet unclassified
establishDropZone: aMorph

	self setProperty: #specialDropZone toValue: aMorph.
	aMorph 
		on: #mouseEnterDragging send: #mouseEnteredDZ to: self;
		on: #mouseLeaveDragging send: #mouseLeftDZ to: self;
		on: #mouseLeave send: #mouseLeftDZ to: self.
