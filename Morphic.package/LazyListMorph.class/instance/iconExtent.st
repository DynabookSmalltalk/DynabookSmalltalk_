layout
iconExtent

	^ iconExtent ifNil: [
		self getListSize = 0
			ifTrue: [((14@14) * RealEstateAgent scaleFactor) truncated]
			ifFalse: [(self icon: 1) ifNil: [0@0] ifNotNil: [:form | form extent]]]