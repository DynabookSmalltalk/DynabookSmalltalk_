private
opt: aBlock

	^ self ometaOr: {
		[aBlock value].
		[nil]
	}