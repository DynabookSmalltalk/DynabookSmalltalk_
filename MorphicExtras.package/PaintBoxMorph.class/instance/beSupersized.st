initialization
beSupersized
	| scaleFactor |
	scaleFactor := RealEstateAgent scaleFactor.
	self isFlexed
		ifFalse: [self scaleFactor: scaleFactor.
			self position: self position / scaleFactor.
			self changed]